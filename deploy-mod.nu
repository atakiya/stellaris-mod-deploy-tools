#!/usr/bin/env nu

source ./shared/common-vars.nu

# Don't need catchall as the common vars script will error out
# also crossplatform ln when 🥺
match $nu.os-info.name {
	"windows" => {
		MKLINK /D $canonical_mod_path $env.PWD
	},
	"linux" => {
		ln --verbose --symbolic $env.PWD $canonical_mod_path
	}
}

cp --verbose --force $mod_descriptor $"($canonical_mod_path).mod"
