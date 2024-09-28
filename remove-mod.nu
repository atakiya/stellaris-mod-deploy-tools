#!/usr/bin/env nu

source ./shared/common-vars.nu

rm --verbose --force $canonical_mod_path
rm --verbose --force $"($canonical_mod_path).mod"
