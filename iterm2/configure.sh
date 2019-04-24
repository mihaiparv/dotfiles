#!/usr/bin/env bash
#
# configures iTerm2.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

info "› Installing Solarized Dark theme for iTerm2"
open "$DOTFILES_ROOT/iterm2/Solarized Dark.itermcolors"

info '› Restoring iTerm2 DynamicProfiles'
local overwrite_all=false backup_all=false skip_all=false
link_file $DOTFILES_ROOT/preferences/symlink/iTerm2/DynamicProfiles ~/Library/Application\ Support/iTerm2/DynamicProfiles
