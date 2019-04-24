#!/usr/bin/env bash
#
# configures MenuMeters.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

configure () {
  local overwrite_all=false backup_all=false skip_all=false
  copy_file $DOTFILES_ROOT/preferences/transform/com.ragingmenace.MenuMeters.plist ~/Library/Preferences/com.ragingmenace.MenuMeters.plist
}

info "› Restoring MenuMeters preferences"
configure
