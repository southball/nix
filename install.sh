#!/bin/bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
. /home/southball/.nix-profile/etc/profile.d/nix.sh
export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

