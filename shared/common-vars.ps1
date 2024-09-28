#!/usr/bin/env pwsh

# Pull requests to add support for other platforms are welcome
if ("Win32NT" -ne [System.Environment]::OSVersion.Platform) {
	Write-Error "This script currently only supports PowerShell on Windows"
	exit 1
}

# Support for PowerShell 5.1 is too flaky to be worth it
# Users would have to run this script with elevated privileges
# 	due to the creation of symbolic links, or we'd have to bypass
# 	it via MKLINK, IF the user even has dev mode enabled.
# Anyone consciously using PowerShell should be on version 7 or newer
if (7 -gt $PSVersionTable.PSVersion.Major) {
	Write-Error "This script requires PowerShell 7 or newer"
	exit 1
}

$mod_descriptor = "$PWD/descriptor.mod"

if (-not [System.IO.File]::Exists($mod_descriptor)) {
	Write-Error "Could not find a descriptor.mod file in the current directory"
	exit 1
}

$mods_directory = "$([Environment]::GetFolderPath("MyDocuments"))/Paradox Interactive/Stellaris/mod/"
(Select-String -Path "$mod_descriptor" -Pattern "path" -SimpleMatch) -match 'path\s*=\s*"mod/(?<name>.+?)"' | Out-Null
$mod_name = $matches.name

$canonical_mod_path = "$mods_directory/$mod_name"

Write-Host "Using internal name: $mod_name"
