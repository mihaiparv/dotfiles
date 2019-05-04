#!/usr/bin/env bash
#
# configures Lastpass.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

configure () {
  mkdir -p ~/.lpass
  local overwrite_all=false backup_all=false skip_all=false
  link_file $DOTFILES_ROOT/lpass/env ~/.lpass/env
}

info '› Configuring lpass environment'
configure
