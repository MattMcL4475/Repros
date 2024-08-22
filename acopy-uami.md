```bash
matt@DESKTOP-NECG1MP:/mnt/c/Users/mattmcl/source/repos/AzCopyTest$ ./azcopy-uami.sh
Step 1: Create a resource group
{
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_18517",
  "location": "swedencentral",
  "managedBy": null,
  "name": "mattmcl_AzureResourceGroup_18517",
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
  "clientId": "f7659b83-2d7c-4c64-8bb2-497466df3e38",
  "id": "/subscriptions/REMOVED/resourcegroups/mattmcl_AzureResourceGroup_18517/providers/Microsoft.ManagedIdentity/userAssignedIdentities/MI_StorageAccessIdentity",
  "location": "swedencentral",
  "name": "MI_StorageAccessIdentity",
  "principalId": "0ce637cd-3efc-4751-93e6-e659543156c9",
  "resourceGroup": "mattmcl_AzureResourceGroup_18517",
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
  "creationTime": "2024-08-22T21:13:22.488921+00:00",
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
        "lastEnabledTime": "2024-08-22T21:13:22.879602+00:00"
      },
      "file": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2024-08-22T21:13:22.879602+00:00"
      },
      "queue": null,
      "table": null
    }
  },
  "extendedLocation": null,
  "failoverInProgress": null,
  "geoReplicationStats": null,
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_18517/providers/Microsoft.Storage/storageAccounts/stgaccount5710",
  "identity": null,
  "immutableStorageWithVersioning": null,
  "isHnsEnabled": null,
  "isLocalUserEnabled": null,
  "isSftpEnabled": null,
  "isSkuConversionBlocked": null,
  "keyCreationTime": {
    "key1": "2024-08-22T21:13:22.567128+00:00",
    "key2": "2024-08-22T21:13:22.567128+00:00"
  },
  "keyPolicy": null,
  "kind": "StorageV2",
  "largeFileSharesState": null,
  "lastGeoFailoverTime": null,
  "location": "swedencentral",
  "minimumTlsVersion": "TLS1_2",
  "name": "stgaccount5710",
  "networkRuleSet": {
    "bypass": "AzureServices",
    "defaultAction": "Allow",
    "ipRules": [],
    "ipv6Rules": [],
    "resourceAccessRules": null,
    "virtualNetworkRules": []
  },
  "primaryEndpoints": {
    "blob": "https://stgaccount5710.blob.core.windows.net/",
    "dfs": "https://stgaccount5710.dfs.core.windows.net/",
    "file": "https://stgaccount5710.file.core.windows.net/",
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://stgaccount5710.queue.core.windows.net/",
    "table": "https://stgaccount5710.table.core.windows.net/",
    "web": "https://stgaccount5710.z1.web.core.windows.net/"
  },
  "primaryLocation": "swedencentral",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "publicNetworkAccess": null,
  "resourceGroup": "mattmcl_AzureResourceGroup_18517",
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
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_18517/providers/Microsoft.Compute/virtualMachines/VM_UbuntuInstance",
  "identity": {
    "systemAssignedIdentity": "",
    "userAssignedIdentities": {
      "/subscriptions/REMOVED/resourcegroups/mattmcl_AzureResourceGroup_18517/providers/Microsoft.ManagedIdentity/userAssignedIdentities/MI_StorageAccessIdentity": {
        "clientId": "f7659b83-2d7c-4c64-8bb2-497466df3e38",
        "principalId": "0ce637cd-3efc-4751-93e6-e659543156c9"
      }
    }
  },
  "location": "swedencentral",
  "macAddress": "7C-1E-52-22-14-69",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.4",
  "publicIpAddress": "4.223.142.3",
  "resourceGroup": "mattmcl_AzureResourceGroup_18517",
  "zones": ""
}
Step 5: Assign 'Storage Blob Data Contributor' role to the VM on the storage account
{
  "condition": null,
  "conditionVersion": null,
  "createdBy": null,
  "createdOn": "2024-08-22T21:15:10.713563+00:00",
  "delegatedManagedIdentityResourceId": null,
  "description": null,
  "id": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_18517/providers/Microsoft.Storage/storageAccounts/stgaccount5710/providers/Microsoft.Authorization/roleAssignments/7a13df14-87a8-4bac-913d-0bac385bc736",
  "name": "7a13df14-87a8-4bac-913d-0bac385bc736",
  "principalId": "0ce637cd-3efc-4751-93e6-e659543156c9",
  "principalType": "ServicePrincipal",
  "resourceGroup": "mattmcl_AzureResourceGroup_18517",
  "roleDefinitionId": "/subscriptions/REMOVED/providers/Microsoft.Authorization/roleDefinitions/ba92f5b4-2d11-453d-a403-e96b0029c9fe",
  "scope": "/subscriptions/REMOVED/resourceGroups/mattmcl_AzureResourceGroup_18517/providers/Microsoft.Storage/storageAccounts/stgaccount5710",
  "type": "Microsoft.Authorization/roleAssignments",
  "updatedBy": "116e6d7c-6cbe-43b9-ab68-76e19f5d13b3",
  "updatedOn": "2024-08-22T21:15:11.313576+00:00"
}
Step 6: SSH into the VM, create a file called 'test.txt', and use AzCopy to upload it
Warning: Permanently added '4.223.142.3' (ED25519) to the list of known hosts.
Hit:1 http://azure.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://azure.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:3 http://azure.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:4 http://azure.archive.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:5 http://azure.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [14.1 MB]
Get:6 http://azure.archive.ubuntu.com/ubuntu jammy/universe Translation-en [5652 kB]
Get:7 http://azure.archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata [286 kB]
Get:8 http://azure.archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [217 kB]
Get:9 http://azure.archive.ubuntu.com/ubuntu jammy/multiverse Translation-en [112 kB]
Get:10 http://azure.archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata [8372 B]
Get:11 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1987 kB]
Get:12 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [349 kB]
Get:13 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [17.8 kB]
Get:14 http://azure.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [2384 kB]
Get:15 http://azure.archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en [410 kB]
Get:16 http://azure.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1112 kB]
Get:17 http://azure.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [260 kB]
Get:18 http://azure.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [26.0 kB]
Get:19 http://azure.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [43.3 kB]
Get:20 http://azure.archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en [10.8 kB]
Get:21 http://azure.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata [444 B]
Get:22 http://azure.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [92.4 kB]
Get:23 http://azure.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.1 kB]
Get:24 http://azure.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [388 B]
Get:25 http://azure.archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata [116 B]
Get:26 http://azure.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [31.4 kB]
Get:27 http://azure.archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [16.5 kB]
Get:28 http://azure.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [672 B]
Get:29 http://azure.archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata [116 B]
Get:30 http://azure.archive.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1769 kB]
Get:31 http://azure.archive.ubuntu.com/ubuntu jammy-security/main Translation-en [290 kB]
Get:32 http://azure.archive.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [13.2 kB]
Get:33 http://azure.archive.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [2308 kB]
Get:34 http://azure.archive.ubuntu.com/ubuntu jammy-security/restricted Translation-en [398 kB]
Get:35 http://azure.archive.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [890 kB]
Get:36 http://azure.archive.ubuntu.com/ubuntu jammy-security/universe Translation-en [175 kB]
Get:37 http://azure.archive.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [19.0 kB]
Get:38 http://azure.archive.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [37.2 kB]
Get:39 http://azure.archive.ubuntu.com/ubuntu jammy-security/multiverse Translation-en [7588 B]
Get:40 http://azure.archive.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata [228 B]
Fetched 33.4 MB in 10s (3282 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
lsb-release is already the newest version (11.1.0ubuntu4).
lsb-release set to manually installed.
ca-certificates is already the newest version (20230311ubuntu0.22.04.1).
ca-certificates set to manually installed.
gnupg is already the newest version (2.2.27-3ubuntu2.1).
gnupg set to manually installed.
The following additional packages will be installed:
  libcurl4
The following NEW packages will be installed:
  apt-transport-https
The following packages will be upgraded:
  curl libcurl4
2 upgraded, 1 newly installed, 0 to remove and 21 not upgraded.
Need to get 485 kB of archives.
After this operation, 170 kB of additional disk space will be used.
Get:1 http://azure.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 apt-transport-https all 2.4.12 [1510 B]
Get:2 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.17 [194 kB]
Get:3 http://azure.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.17 [290 kB]
Fetched 485 kB in 0s (14.0 MB/s)
Selecting previously unselected package apt-transport-https.
(Reading database ... 62122 files and directories currently installed.)
Preparing to unpack .../apt-transport-https_2.4.12_all.deb ...
Unpacking apt-transport-https (2.4.12) ...
Preparing to unpack .../curl_7.81.0-1ubuntu1.17_amd64.deb ...
Unpacking curl (7.81.0-1ubuntu1.17) over (7.81.0-1ubuntu1.16) ...
Preparing to unpack .../libcurl4_7.81.0-1ubuntu1.17_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.17) over (7.81.0-1ubuntu1.16) ...
Setting up apt-transport-https (2.4.12) ...
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.17) ...
Setting up curl (7.81.0-1ubuntu1.17) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.8) ...
NEEDRESTART-VER: 3.5
NEEDRESTART-KCUR: 6.5.0-1025-azure
NEEDRESTART-KEXP: 6.5.0-1025-azure
NEEDRESTART-KSTA: 1
Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: jammy
Components: main
Architectures: amd64
Signed-by: /etc/apt/keyrings/microsoft.gpg
Get:1 https://packages.microsoft.com/repos/azure-cli jammy InRelease [3596 B]
Hit:2 http://azure.archive.ubuntu.com/ubuntu jammy InRelease
Hit:3 http://azure.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://azure.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 http://azure.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:6 https://packages.microsoft.com/repos/azure-cli jammy/main amd64 Packages [1740 B]
Get:7 https://packages.microsoft.com/repos/azure-cli jammy/main all Packages [1099 B]
Fetched 6435 B in 1s (7400 B/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  azure-cli
0 upgraded, 1 newly installed, 0 to remove and 21 not upgraded.
Need to get 57.0 MB of archives.
After this operation, 700 MB of additional disk space will be used.
Get:1 https://packages.microsoft.com/repos/azure-cli jammy/main amd64 azure-cli amd64 2.63.0-1~jammy [57.0 MB]
Fetched 57.0 MB in 1s (90.4 MB/s)
Selecting previously unselected package azure-cli.
(Reading database ... 62126 files and directories currently installed.)
Preparing to unpack .../azure-cli_2.63.0-1~jammy_amd64.deb ...
Unpacking azure-cli (2.63.0-1~jammy) ...
Setting up azure-cli (2.63.0-1~jammy) ...
NEEDRESTART-VER: 3.5
NEEDRESTART-KCUR: 6.5.0-1025-azure
NEEDRESTART-KEXP: 6.5.0-1025-azure
NEEDRESTART-KSTA: 1
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
OK
Get:1 https://packages.microsoft.com/ubuntu/22.04/prod jammy InRelease [3632 B]
Hit:2 https://packages.microsoft.com/repos/azure-cli jammy InRelease
Hit:3 http://azure.archive.ubuntu.com/ubuntu jammy InRelease
Hit:4 http://azure.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:5 http://azure.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:6 http://azure.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:7 https://packages.microsoft.com/ubuntu/22.04/prod jammy/main all Packages [1035 B]
Get:8 https://packages.microsoft.com/ubuntu/22.04/prod jammy/main amd64 Packages [170 kB]
Fetched 175 kB in 1s (187 kB/s)
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
Hit:6 https://packages.microsoft.com/repos/azure-cli jammy InRelease
Reading package lists...
W: https://packages.microsoft.com/ubuntu/22.04/prod/dists/jammy/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  azcopy
0 upgraded, 1 newly installed, 0 to remove and 21 not upgraded.
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
Fetched 16.4 MB in 0s (77.3 MB/s)
Selecting previously unselected package azcopy.
(Reading database ... 97643 files and directories currently installed.)
Preparing to unpack .../azcopy_10.26.0_amd64.deb ...
Unpacking azcopy (10.26.0) ...
Setting up azcopy (10.26.0) ...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
Strategy #1:
WARN: The flags --service-principal and --identity will be deprecated in a future release. Please use --login-type=SPN or --login-type=MSI instead.
INFO: Login with identity succeeded.
INFO: Autologin not specified.
INFO: Authenticating to destination using Unknown, Please authenticate using Microsoft Entra ID (https://aka.ms/AzCopy/AuthZ), use AzCopy login, or append a SAS token to your Azure URL.

PUT https://stgaccount5710.blob.core.windows.net/test
--------------------------------------------------------------------------------
RESPONSE 401: 401 Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
ERROR CODE: NoAuthenticationInformation
--------------------------------------------------------------------------------
﻿<?xml version="1.0" encoding="utf-8"?><Error><Code>NoAuthenticationInformation</Code><Message>Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
RequestId:9c623a0f-b01e-004e-46d8-f426e8000000
Time:2024-08-22T21:17:14.4469609Z</Message></Error>
--------------------------------------------------------------------------------

Strategy #2:
WARN: The flags --service-principal and --identity will be deprecated in a future release. Please use --login-type=SPN or --login-type=MSI instead.
INFO: Login with identity succeeded.
INFO: Autologin not specified.
INFO: Authenticating to destination using Unknown, Please authenticate using Microsoft Entra ID (https://aka.ms/AzCopy/AuthZ), use AzCopy login, or append a SAS token to your Azure URL.

PUT https://stgaccount5710.blob.core.windows.net/test
--------------------------------------------------------------------------------
RESPONSE 401: 401 Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
ERROR CODE: NoAuthenticationInformation
--------------------------------------------------------------------------------
﻿<?xml version="1.0" encoding="utf-8"?><Error><Code>NoAuthenticationInformation</Code><Message>Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
RequestId:5e1783aa-901e-0049-37d8-f44a8b000000
Time:2024-08-22T21:17:21.1149171Z</Message></Error>
--------------------------------------------------------------------------------

Strategy #3:
INFO: Login with identity succeeded.
INFO: Autologin not specified.
INFO: Authenticating to destination using Unknown, Please authenticate using Microsoft Entra ID (https://aka.ms/AzCopy/AuthZ), use AzCopy login, or append a SAS token to your Azure URL.

PUT https://stgaccount5710.blob.core.windows.net/test
--------------------------------------------------------------------------------
RESPONSE 401: 401 Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
ERROR CODE: NoAuthenticationInformation
--------------------------------------------------------------------------------
﻿<?xml version="1.0" encoding="utf-8"?><Error><Code>NoAuthenticationInformation</Code><Message>Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
RequestId:4a2d9ddc-a01e-0042-32d8-f4b1e0000000
Time:2024-08-22T21:17:27.7164112Z</Message></Error>
--------------------------------------------------------------------------------

Strategy #4:
[
  {
    "environmentName": "AzureCloud",
    "homeTenantId": "REMOVED",
    "id": "REMOVED",
    "isDefault": true,
    "managedByTenants": [
      {
        "tenantId": "2f4a9838-26b7-47ee-be60-ccc1fdec5953"
      }
    ],
    "name": "Nexus-RnD",
    "state": "Enabled",
    "tenantId": "REMOVED",
    "user": {
      "assignedIdentityInfo": "MSIClient-f7659b83-2d7c-4c64-8bb2-497466df3e38",
      "name": "userAssignedIdentity",
      "type": "servicePrincipal"
    }
  }
]
INFO: Autologin not specified.
INFO: Authenticating to destination using Unknown, Please authenticate using Microsoft Entra ID (https://aka.ms/AzCopy/AuthZ), use AzCopy login, or append a SAS token to your Azure URL.

PUT https://stgaccount5710.blob.core.windows.net/test
--------------------------------------------------------------------------------
RESPONSE 401: 401 Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
ERROR CODE: NoAuthenticationInformation
--------------------------------------------------------------------------------
﻿<?xml version="1.0" encoding="utf-8"?><Error><Code>NoAuthenticationInformation</Code><Message>Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
RequestId:7a542a72-401e-0065-5dd8-f4a624000000
Time:2024-08-22T21:17:37.6236741Z</Message></Error>
--------------------------------------------------------------------------------

An error occurred. Deleting the resource group...
matt@DESKTOP-NECG1MP:/mnt/c/Users/mattmcl/source/repos/AzCopyTest$
```
