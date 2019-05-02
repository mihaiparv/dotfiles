#!/usr/bin/env bash
#
# Retrieves the ansible vault password from various secret stores

read_ansible_vault_pass_from_keychain () {
  security find-generic-password -s ${ANSIBLE_VAULT_PASS_KEYCHAIN_SERVICE:-"ansible.vault.iq"} -w
}

read_ansible_vault_pass_from_lastpass () {
  lpass show "${ANSIBLE_VAULT_PASS_LPASS_ENTRY:-"Shared-IQ-CI/Ansible Vault Passwords/iqdvop vault"}" "${ANSIBLE_VAULT_PASS_LPASS_FIELD:-"--note"}" -q
}

read_ansible_vault_pass_from_lastpass || read_ansible_vault_pass_from_keychain