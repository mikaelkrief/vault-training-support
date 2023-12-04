1- create the policy vault-agent (agent-policy.hcl)

2- create the vault agent config file

3- enable the approle

vault auth enable approle

4- create the vaultagent role

vault write auth/approle/role/vaultagent token_policies="vault-agent"

