#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$script_dir/shared/common-vars.sh"

rm --verbose --force -- "${canonical_mod_path:?}"
rm --verbose --force -- "${canonical_mod_path:?}.mod"
