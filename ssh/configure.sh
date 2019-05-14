#!/usr/bin/env bash
#
# configures ssh and personal keys.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

. $DOTFILES_ROOT/bin/lib/functions.sh

configure () {
  mkdir -p ~/.ssh
  read_from_lastpass_to_file "iQuest\personal\ssh/config" "--notes" ~/.ssh/config "u=rw,go=r"
  read_from_lastpass_to_file "iQuest\personal\ssh/mihai.parv@iquestgroup.com" "--field=Private Key" ~/.ssh/mihai.parv@iquestgroup.com "u=rw,go="
  read_from_lastpass_to_file "iQuest\personal\ssh/mihai.parv@iquestgroup.com" "--field=Public Key" ~/.ssh/mihai.parv@iquestgroup.com.pub "u=rw,go="
  read_from_lastpass_to_file "personal\ssh/mihai.parv@gmail.com" "--field=Private Key" ~/.ssh/mihai.parv@gmail.com "u=rw,go="
  read_from_lastpass_to_file "personal\ssh/mihai.parv@yahoo.com" "--field=Private Key" ~/.ssh/mihai.parv@yahoo.com "u=rw,go="
}

info '› Configuring ssh'
configure
