#!/usr/bin/env bash
#
# Retrieves the ansible vault password from various secret stores

configureAnsibleVaultLPassEntry() {
  crtDir=${PWD}
  while [[ $(realpath ${crtDir}) != '/' ]]
  do
    [[ -f ${crtDir}/.ansible_vault_cfg ]] && . ${crtDir}/.ansible_vault_cfg
    if [[ ! -z "${ANSIBLE_VAULT_PASS_LPASS_ENTRY}" ]]; then
      break
    fi
    crtDir="${crtDir}/.."
  done
}

read_ansible_vault_pass_from_keychain () {
  security find-generic-password -s ${ANSIBLE_VAULT_PASS_KEYCHAIN_SERVICE:-"ansible.vault.iq"} -w
}

read_ansible_vault_pass_from_lastpass () {
  lpass show "${ANSIBLE_VAULT_PASS_LPASS_ENTRY:-"ANt\\Ansible Vault Passwords/internal"}" "${ANSIBLE_VAULT_PASS_LPASS_FIELD:-"--note"}" -q
}

configureAnsibleVaultLPassEntry
read_ansible_vault_pass_from_lastpass || read_ansible_vault_pass_from_keychain