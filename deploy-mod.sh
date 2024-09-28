#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$script_dir/shared/common-vars.sh"

ln --verbose --symbolic "$PWD" "${canonical_mod_path:?}"
cp --verbose --force "$mod_descriptor" "${canonical_mod_path:?}.mod"
