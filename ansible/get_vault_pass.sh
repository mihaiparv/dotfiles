#!/usr/bin/env bash
#
# Retrieves the ansible vault password from the OS X Keychain

read_ansible_vault_pass_from_keychain () {
  security find-generic-password -s ${ANSIBLE_VAULT_PASS_KEYCHAIN_SERVICE:-"ansible.vault.iq"} -w
}

read_ansible_vault_pass_from_keychain