#!/usr/bin/env bash
#
# configures maven.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

configure () {
  mkdir -p ~/.m2
  local overwrite_all=false backup_all=false skip_all=false
  link_file $DOTFILES_ROOT/preferences/symlink/m2/settings.xml ~/.m2/settings.xml
  link_file $DOTFILES_ROOT/preferences/symlink/m2/settings-security.xml ~/.m2/settings.xml
}

info '› Configuring maven settings'
configure
