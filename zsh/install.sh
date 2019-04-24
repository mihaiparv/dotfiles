#!/usr/bin/env bash
#
# install zsh.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

info "› Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
