#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. /home/southball/.nix-profile/etc/profile.d/nix.sh
home-manager switch -f $SCRIPT_DIR/home.nix $*
