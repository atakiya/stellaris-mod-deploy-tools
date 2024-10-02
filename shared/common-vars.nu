#!/usr/bin/env nu

let mod_descriptor = $"($env.PWD)/descriptor.mod"

let mod_name = open $mod_descriptor | lines | parse '{key}={value}' | str trim | transpose -r | get path | get 0 | str trim --char '"' | split row "/" | last

let user_data_home = match $nu.os-info.name {
	"windows" => {
		registry query --hkcu 'Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' 'Personal' | get value
	},
	"linux" => {
		$env.XDG_DATA_HOME? | default $"($nu.home-path)/.local/share"
	},
	$osname => {
		error make --unspanned { msg: $"Unsupported OS: ($osname)" }
	}
}

let mods_directory = $"($user_data_home)/Paradox Interactive/Stellaris/mod/"
let canonical_mod_path = $"($mods_directory)/($mod_name)"

print $"Using internal name: ($mod_name)"
