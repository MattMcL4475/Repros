# Software Issues

## Using a user-assigned managed identity with a storage account that has shared keys disabled
This script creates a resource group, a user-assigned managed identity, a storage account, and a virtual machine. It assigns the "Storage Blob Data Contributor" role to the user-assigned managed identity and attempts to upload a test file to an Azure Blob storage container using AzCopy. The script includes multiple strategies for using the managed identity to authenticate with AzCopy, all of which fail.

https://github.com/MattMcL4475/Repros/blob/main/azcopy-uami.sh
