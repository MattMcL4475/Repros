```bash
matt@DESKTOP-NECG1MP:/mnt/c/Users/mattmcl/source/repos/AzCopyTest$ ./test.sh
Step 1: Create a resource group
{
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_683",
  "location": "swedencentral",
  "managedBy": null,
  "name": "mattmcl_AzureResourceGroup_683",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": {
    "ringValue": "r1"
  },
  "type": "Microsoft.Resources/resourceGroups"
}
Step 2: Create a user-assigned managed identity
{
  "clientId": "3588906a-1f51-45c7-b575-23926ecdfaf9",
  "id": "/subscriptions/REMOVED/resourcegroups/mattmcl_AzureResourceGroup_683/providers/Microsoft.ManagedIdentity/userAssignedIdentities/MI_StorageAccessIdentity",
  "location": "swedencentral",
  "name": "MI_StorageAccessIdentity",
  "principalId": "a91152c1-a935-4c48-9f47-f23ddffcb74d",
  "resourceGroup": "mattmcl_AzureResourceGroup_683",
  "systemData": null,
  "tags": {},
  "tenantId": "REMOVED",
  "type": "Microsoft.ManagedIdentity/userAssignedIdentities"
}
Step 3: Create a storage account with shared key access disabled
{
  "accessTier": "Hot",
  "accountMigrationInProgress": null,
  "allowBlobPublicAccess": false,
  "allowCrossTenantReplication": false,
  "allowSharedKeyAccess": false,
  "allowedCopyScope": null,
  "azureFilesIdentityBasedAuthentication": null,
  "blobRestoreStatus": null,
  "creationTime": "2024-08-22T20:45:39.115225+00:00",
  "customDomain": null,
  "defaultToOAuthAuthentication": null,
  "dnsEndpointType": null,
  "enableExtendedGroups": null,
  "enableHttpsTrafficOnly": true,
  "enableNfsV3": null,
  "encryption": {
    "encryptionIdentity": null,
    "keySource": "Microsoft.Storage",
    "keyVaultProperties": null,
    "requireInfrastructureEncryption": null,
    "services": {
      "blob": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2024-08-22T20:45:39.474678+00:00"
      },
      "file": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2024-08-22T20:45:39.474678+00:00"
      },
      "queue": null,
      "table": null
    }
  },
  "extendedLocation": null,
  "failoverInProgress": null,
  "geoReplicationStats": null,
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_683/providers/Microsoft.Storage/storageAccounts/stgaccount1476",
  "identity": null,
  "immutableStorageWithVersioning": null,
  "isHnsEnabled": null,
  "isLocalUserEnabled": null,
  "isSftpEnabled": null,
  "isSkuConversionBlocked": null,
  "keyCreationTime": {
    "key1": "2024-08-22T20:45:39.177739+00:00",
    "key2": "2024-08-22T20:45:39.177739+00:00"
  },
  "keyPolicy": null,
  "kind": "StorageV2",
  "largeFileSharesState": null,
  "lastGeoFailoverTime": null,
  "location": "swedencentral",
  "minimumTlsVersion": "TLS1_2",
  "name": "stgaccount1476",
  "networkRuleSet": {
    "bypass": "AzureServices",
    "defaultAction": "Allow",
    "ipRules": [],
    "ipv6Rules": [],
    "resourceAccessRules": null,
    "virtualNetworkRules": []
  },
  "primaryEndpoints": {
    "blob": "https://stgaccount1476.blob.core.windows.net/",
    "dfs": "https://stgaccount1476.dfs.core.windows.net/",
    "file": "https://stgaccount1476.file.core.windows.net/",
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://stgaccount1476.queue.core.windows.net/",
    "table": "https://stgaccount1476.table.core.windows.net/",
    "web": "https://stgaccount1476.z1.web.core.windows.net/"
  },
  "primaryLocation": "swedencentral",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "publicNetworkAccess": null,
  "resourceGroup": "mattmcl_AzureResourceGroup_683",
  "routingPreference": null,
  "sasPolicy": null,
  "secondaryEndpoints": null,
  "secondaryLocation": null,
  "sku": {
    "name": "Standard_LRS",
    "tier": "Standard"
  },
  "statusOfPrimary": "available",
  "statusOfSecondary": null,
  "storageAccountSkuConversionStatus": null,
  "tags": {},
  "type": "Microsoft.Storage/storageAccounts"
}
Step 4: Create a virtual machine with the managed identity
{
  "fqdns": "",
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_683/providers/Microsoft.Compute/virtualMachines/VM_UbuntuInstance",
  "identity": {
    "systemAssignedIdentity": "",
    "userAssignedIdentities": {
      "/subscriptions/REMOVED/resourcegroups/mattmcl_AzureResourceGroup_683/providers/Microsoft.ManagedIdentity/userAssignedIdentities/MI_StorageAccessIdentity": {
        "clientId": "3588906a-1f51-45c7-b575-23926ecdfaf9",
        "principalId": "a91152c1-a935-4c48-9f47-f23ddffcb74d"
      }
    }
  },
  "location": "swedencentral",
  "macAddress": "60-45-BD-AC-A7-E7",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.4",
  "publicIpAddress": "4.223.73.199",
  "resourceGroup": "mattmcl_AzureResourceGroup_683",
  "zones": ""
}
Step 5: Assign 'Storage Blob Data Contributor' role to the VM on the storage account
{
  "condition": null,
  "conditionVersion": null,
  "createdBy": null,
  "createdOn": "2024-08-22T20:47:24.936966+00:00",
  "delegatedManagedIdentityResourceId": null,
  "description": null,
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_683/providers/Microsoft.Storage/storageAccounts/stgaccount1476/providers/Microsoft.Authorization/roleAssignments/45db8711-cd81-41f0-ac58-14978a6feea2",
  "name": "45db8711-cd81-41f0-ac58-14978a6feea2",
  "principalId": "a91152c1-a935-4c48-9f47-f23ddffcb74d",
  "principalType": "ServicePrincipal",
  "resourceGroup": "mattmcl_AzureResourceGroup_683",
  "roleDefinitionId": "/subscriptions/REMOVED/providers/Microsoft.Authorization/roleDefinitions/ba92f5b4-2d11-453d-a403-e96b0029c9fe",
  "scope": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_683/providers/Microsoft.Storage/storageAccounts/stgaccount1476",
  "type": "Microsoft.Authorization/roleAssignments",
  "updatedBy": "116e6d7c-6cbe-43b9-ab68-76e19f5d13b3",
  "updatedOn": "2024-08-22T20:47:25.474968+00:00"
}
Step 6: SSH into the VM, create a file called 'test.txt', and use AzCopy to upload it
Warning: Permanently added '4.223.73.199' (ED25519) to the list of known hosts.
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
OK
Get:1 https://packages.microsoft.com/ubuntu/22.04/prod jammy InRelease [3632 B]
Hit:2 http://azure.archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://azure.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://azure.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:5 http://azure.archive.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:6 https://packages.microsoft.com/ubuntu/22.04/prod jammy/main amd64 Packages [170 kB]
Get:7 https://packages.microsoft.com/ubuntu/22.04/prod jammy/main all Packages [1035 B]
Get:8 http://azure.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [14.1 MB]
Get:9 http://azure.archive.ubuntu.com/ubuntu jammy/universe Translation-en [5652 kB]
Get:10 http://azure.archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata [286 kB]
Get:11 http://azure.archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [217 kB]
Get:12 http://azure.archive.ubuntu.com/ubuntu jammy/multiverse Translation-en [112 kB]
Get:13 http://azure.archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata [8372 B]
Get:14 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1987 kB]
Get:15 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [349 kB]
Get:16 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [17.8 kB]
Get:17 http://azure.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [2384 kB]
Get:18 http://azure.archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en [410 kB]
Get:19 http://azure.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1112 kB]
Get:20 http://azure.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [260 kB]
Get:21 http://azure.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [26.0 kB]
Get:22 http://azure.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [43.3 kB]
Get:23 http://azure.archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en [10.8 kB]
Get:24 http://azure.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata [444 B]
Get:25 http://azure.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [92.4 kB]
Get:26 http://azure.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.1 kB]
Get:27 http://azure.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [388 B]
Get:28 http://azure.archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata [116 B]
Get:29 http://azure.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [31.4 kB]
Get:30 http://azure.archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [16.5 kB]
Get:31 http://azure.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [672 B]
Get:32 http://azure.archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata [116 B]
Get:33 http://azure.archive.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1769 kB]
Get:34 http://azure.archive.ubuntu.com/ubuntu jammy-security/main Translation-en [290 kB]
Get:35 http://azure.archive.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [13.2 kB]
Get:36 http://azure.archive.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [2308 kB]
Get:37 http://azure.archive.ubuntu.com/ubuntu jammy-security/restricted Translation-en [398 kB]
Get:38 http://azure.archive.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [890 kB]
Get:39 http://azure.archive.ubuntu.com/ubuntu jammy-security/universe Translation-en [175 kB]
Get:40 http://azure.archive.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [19.0 kB]
Get:41 http://azure.archive.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [37.2 kB]
Get:42 http://azure.archive.ubuntu.com/ubuntu jammy-security/multiverse Translation-en [7588 B]
Get:43 http://azure.archive.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata [228 B]
Fetched 33.6 MB in 10s (3346 kB/s)
Reading package lists...
W: https://packages.microsoft.com/ubuntu/22.04/prod/dists/jammy/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
Repository: 'deb https://packages.microsoft.com/ubuntu/22.04/prod jammy main'
Description:
Archive for codename: jammy components: main
More info: https://packages.microsoft.com/ubuntu/22.04/prod
Adding repository.
Adding deb entry to /etc/apt/sources.list.d/archive_uri-https_packages_microsoft_com_ubuntu_22_04_prod-jammy.list
Adding disabled deb-src entry to /etc/apt/sources.list.d/archive_uri-https_packages_microsoft_com_ubuntu_22_04_prod-jammy.list
Hit:1 http://azure.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://azure.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://azure.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 http://azure.archive.ubuntu.com/ubuntu jammy-security InRelease
Hit:5 https://packages.microsoft.com/ubuntu/22.04/prod jammy InRelease
Reading package lists...
W: https://packages.microsoft.com/ubuntu/22.04/prod/dists/jammy/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  azcopy
0 upgraded, 1 newly installed, 0 to remove and 23 not upgraded.
Need to get 16.4 MB of archives.
After this operation, 34.2 MB of additional disk space will be used.
Get:1 https://packages.microsoft.com/ubuntu/22.04/prod jammy/main amd64 azcopy amd64 10.26.0 [16.4 MB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin:
Fetched 16.4 MB in 1s (28.5 MB/s)
Selecting previously unselected package azcopy.
(Reading database ... 62122 files and directories currently installed.)
Preparing to unpack .../azcopy_10.26.0_amd64.deb ...
Unpacking azcopy (10.26.0) ...
Setting up azcopy (10.26.0) ...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
WARN: The flags --service-principal and --identity will be deprecated in a future release. Please use --login-type=SPN or --login-type=MSI instead.
INFO: Login with identity succeeded.
INFO: Autologin not specified.
INFO: Authenticating to destination using Unknown, Please authenticate using Microsoft Entra ID (https://aka.ms/AzCopy/AuthZ), use AzCopy login, or append a SAS token to your Azure URL.

PUT https://stgaccount1476.blob.core.windows.net/test
--------------------------------------------------------------------------------
RESPONSE 401: 401 Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
ERROR CODE: NoAuthenticationInformation
--------------------------------------------------------------------------------
﻿<?xml version="1.0" encoding="utf-8"?><Error><Code>NoAuthenticationInformation</Code><Message>Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
RequestId:8cef9edc-d01e-0015-26d4-f41fd3000000
Time:2024-08-22T20:48:54.1673186Z</Message></Error>
--------------------------------------------------------------------------------

An error occurred. Deleting the resource group...
```
