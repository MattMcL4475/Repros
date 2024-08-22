SUBSCRIPTION_ID="REMOVED"
RESOURCE_GROUP_NAME="mattmcl_AzureResourceGroup_$RANDOM"
LOCATION="swedencentral"
MANAGED_IDENTITY_NAME="MI_StorageAccessIdentity"
VIRTUAL_MACHINE_NAME="VM_UbuntuInstance"
STORAGE_ACCOUNT_NAME="stgaccount$RANDOM"
BLOB_CONTAINER_NAME="test"
VIRTUAL_MACHINE_SIZE="Standard_DS1_v2"
VM_IMAGE="Ubuntu2204"
ADMIN_USERNAME="azureuser"
TEST_FILE_NAME="test.txt"

# Function to echo in blue
echo_blue() {
    echo -e "\033[34m$1\033[0m"
}

# Set the Azure subscription
az account set --subscription $SUBSCRIPTION_ID

# Function to delete the resource group
delete_resource_group() {
    echo_blue "An error occurred. Deleting the resource group..."
    az group delete --name $RESOURCE_GROUP_NAME --yes --no-wait
    exit 1
}

# Set a trap to catch any error and delete the resource group
trap 'delete_resource_group' ERR

echo_blue "Step 1: Create a resource group"
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

echo_blue "Step 2: Create a user-assigned managed identity"
az identity create --name $MANAGED_IDENTITY_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION

# Capture the identity ID and client ID
MANAGED_IDENTITY_ID=$(az identity show --name $MANAGED_IDENTITY_NAME --resource-group $RESOURCE_GROUP_NAME --query id --output tsv)
MANAGED_IDENTITY_CLIENT_ID=$(az identity show --name $MANAGED_IDENTITY_NAME --resource-group $RESOURCE_GROUP_NAME --query clientId --output tsv)

echo_blue "Step 3: Create a storage account with shared key access disabled"
az storage account create --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --location $LOCATION \
  --sku Standard_LRS \
  --allow-blob-public-access false \
  --min-tls-version TLS1_2 \
  --https-only true \
  --allow-shared-key-access false

echo_blue "Step 4: Create a virtual machine with the managed identity"
az vm create \
  --resource-group $RESOURCE_GROUP_NAME \
  --name $VIRTUAL_MACHINE_NAME \
  --image $VM_IMAGE \
  --admin-username $ADMIN_USERNAME \
  --size $VIRTUAL_MACHINE_SIZE \
  --assign-identity $MANAGED_IDENTITY_ID

# Capture the VM's ID and public IP address
VIRTUAL_MACHINE_ID=$(az vm show --name $VIRTUAL_MACHINE_NAME --resource-group $RESOURCE_GROUP_NAME --query id --output tsv)
VIRTUAL_MACHINE_PUBLIC_IP=$(az vm list-ip-addresses --name $VIRTUAL_MACHINE_NAME --resource-group $RESOURCE_GROUP_NAME --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv)

echo_blue "Step 5: Assign 'Storage Blob Data Contributor' role to the VM on the storage account"
az role assignment create \
  --assignee $MANAGED_IDENTITY_CLIENT_ID \
  --role "Storage Blob Data Contributor" \
  --scope $(az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --query id --output tsv)

# Adding a delay to ensure role assignment propagation
sleep 30

echo_blue "Step 6: SSH into the VM, create a file called '$TEST_FILE_NAME', and use AzCopy to upload it"

# Prepare the SSH command
SSH_COMMAND="ssh -o StrictHostKeyChecking=no $ADMIN_USERNAME@$VIRTUAL_MACHINE_PUBLIC_IP"

# Create the test file on the VM
$SSH_COMMAND "echo 'Hello World' > $TEST_FILE_NAME"

# Install the Azure CLI and AzCopy on the VM
$SSH_COMMAND "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash"
$SSH_COMMAND "curl -sL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -"
$SSH_COMMAND "sudo add-apt-repository https://packages.microsoft.com/ubuntu/22.04/prod"
$SSH_COMMAND "sudo apt-get update"
$SSH_COMMAND "sudo apt-get install -y azcopy"

# Use AzCopy with the managed identity to upload the file
try_strategy1() {
  echo_blue "Strategy #1:"
  $SSH_COMMAND "export AZCOPY_AUTO_LOGIN_TYPE=\"MSI\" && \
                azcopy login --identity && \
                azcopy make \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME\" && \
                azcopy copy \"$TEST_FILE_NAME\" \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME/$TEST_FILE_NAME\""
}

try_strategy2() {
  echo_blue "Strategy #2:"
  $SSH_COMMAND "export AZCOPY_AUTO_LOGIN_TYPE=\"MSI\" && \
                azcopy login --identity --identity-client-id \"$MANAGED_IDENTITY_CLIENT_ID\" && \
                azcopy make \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME\" && \
                azcopy copy \"$TEST_FILE_NAME\" \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME/$TEST_FILE_NAME\""
}

try_strategy3() {
  echo_blue "Strategy #3:"
  $SSH_COMMAND "export AZCOPY_AUTO_LOGIN_TYPE=\"MSI\" && \
                azcopy login --login-type=MSI --identity-client-id \"$MANAGED_IDENTITY_CLIENT_ID\" && \
                azcopy make \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME\" && \
                azcopy copy \"$TEST_FILE_NAME\" \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME/$TEST_FILE_NAME\""
}

try_strategy4() {
  echo_blue "Strategy #4:"
  $SSH_COMMAND "export AZCOPY_AUTO_LOGIN_TYPE=\"AZCLI\" && \
                az login --identity --username \"$MANAGED_IDENTITY_CLIENT_ID\" --allow-no-subscriptions && \
                azcopy make \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME\" && \
                azcopy copy \"$TEST_FILE_NAME\" \"https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME/$TEST_FILE_NAME\""
}

# Temporarily disable the global ERR trap
trap - ERR

# Main script execution with local trap mechanism
if ! try_strategy1 && ! try_strategy2 && ! try_strategy3 && ! try_strategy4; then
  # If all strategies fail, trigger the global ERR trap manually
  delete_resource_group
fi

echo_blue "Script execution completed successfully."

# Explicit cleanup if everything went well
delete_resource_group
