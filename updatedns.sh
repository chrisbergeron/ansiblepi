#!/bin/bash
time ansible-playbook update_dns.yml -e @vault/vault.yml --vault-password-file ~/.cbvault.pass.txt