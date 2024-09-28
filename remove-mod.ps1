#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"

. $PSScriptRoot/shared/common-vars.ps1

# Make sure vars exist so we don't mess up paths
Get-Variable -Name canonical_mod_path | Out-Null

try {
	Remove-Item -Force -Recurse -Path "$canonical_mod_path"
	Remove-Item -Force -Path "$canonical_mod_path.mod"
} catch [System.Management.Automation.ItemNotFoundException] { $null }
