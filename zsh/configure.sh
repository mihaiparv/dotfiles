#!/usr/bin/env bash
#
# configures zsh.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

info "› Configuring brew zsh as standard shell"
grep "/usr/local/bin/zsh" /etc/shells || echo /usr/local/bin/zsh | sudo tee -a /etc/shells

info "› Installing Powerlevel9k theme for oh-my-zsh"
[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ] && git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
