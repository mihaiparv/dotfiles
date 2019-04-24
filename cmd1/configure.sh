#!/usr/bin/env bash
#
# configures Commander One.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

info "› Restoring Commander One preferences"
local overwrite_all=false backup_all=false skip_all=false
copy_file $DOTFILES_ROOT/preferences/transform/com.eltima.cmd1.plist ~/Library/Preferences/com.eltima.cmd1.plist
