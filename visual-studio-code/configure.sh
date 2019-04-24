#!/usr/bin/env bash
#
# configures VS Code.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

info "› Restoring VS Code preferences"
code -v > /dev/null
if [[ $? -eq 0 ]];then
  user "Do you want to install VSC extensions? [y|N]"
  read -r -n 1 configresponse
  if [[ $configresponse =~ ^(y|Y) ]];then
    echo "Installing extensions please wait..."
    code --install-extension dhoeric.ansible-vault
    code --install-extension donjayamanne.githistory
    code --install-extension eamodio.gitlens
    code --install-extension joaompinto.asciidoctor-vscode
    code --install-extension HookyQR.beautify
    code --install-extension mauve.terraform
    code --install-extension PeterJausovec.vscode-docker
    code --install-extension vscoss.vscode-ansible

    success "Extensions for VSC have been installed. Please restart your VSC."
  else
    info "Skipping extension install.";
  fi

  info 'Restoring VS Code settings'
  local overwrite_all=false backup_all=false skip_all=false
  link_file $HOME/.dotfiles/visual-studio-code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
else
  fail "It looks like the command 'code' isn't accessible."
  fail "Please make sure you have Visual Studio Code installed"
  fail "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
fi
