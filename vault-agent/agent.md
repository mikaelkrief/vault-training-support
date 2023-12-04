1- créé la policy vault-agent (agent-policy.hcl) qui contient les policies des secrets a recuperer par l'agent

vault policy write vault-agent agent-policy.hcl

2- CRéé le fichier de config du vault agent vault-agant.hcl

3- enable the approle

vault auth enable approle

4- create the vaultagent role

vault write auth/approle/role/vaultagent token_policies="vault-agent"

5- Recuperation du role id et secret id
vault read auth/approle/role/vaultagent/role-id

vault write -force auth/approle/role/vaultagent/secret-id


6- Ecrire le role id et secret id dans /tmp/role_id et /tmp/secret_id

7- Lancer l’agent. vault agent -config=vault-agent.hcl

8- Recuperation du token dans /tmp/token

Authentification avec ce token 