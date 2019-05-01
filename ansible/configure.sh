#!/usr/bin/env bash
#
# configures ansible.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

configure () {
  mkdir -p ~/.ansible
  local overwrite_all=false backup_all=false skip_all=false
  link_file $DOTFILES_ROOT/ansible/get_vault_pass.sh ~/.ansible/get_vault_pass.sh
}

info '› Configuring ansible vault pass script'
configure
