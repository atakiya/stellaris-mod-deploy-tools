#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"

. $PSScriptRoot/shared/common-vars.ps1

# Make sure vars exist so we don't mess up paths
Get-Variable -Name canonical_mod_path | Out-Null
Get-Variable -Name mod_descriptor | Out-Null

New-Item -Force -ItemType SymbolicLink -Path "$canonical_mod_path" -Value "$PWD"

Copy-Item -Force -Path "$mod_descriptor" -Destination "$canonical_mod_path.mod"
