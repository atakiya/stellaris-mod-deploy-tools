#!/usr/bin/env bash
set -e

user_data_home=${XDG_DATA_HOME:-$HOME/.local/share}

mod_descriptor="${PWD:?}/descriptor.mod"

if [ ! -f "$mod_descriptor" ]; then
	echo "Could not find a descriptor.mod file in $PWD"
	exit 1
fi

mod_name=$(grep -oP 'path\s*=\s*"mod\/\K(.+?)(?=")' "$mod_descriptor")
mods_directory="$user_data_home/Paradox Interactive/Stellaris/mod/"

# shellcheck disable=SC2034
canonical_mod_path="${mods_directory:?}/${mod_name:?}"

echo "Using internal name: $mod_name"
