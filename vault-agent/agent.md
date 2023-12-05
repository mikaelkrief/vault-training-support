# TP Vault Agent

1- Créer la policy vault-agent (agent-policy.hcl) qui contient les policies des secrets à recuperer par l'agent

```vault policy write vault-agent agent-policy.hcl```

2- Créer le fichier de config du vault agent vault-agent.hcl

3- Activer l'authentification approle

```vault auth enable approle```

4- Créer le role du approle

```vault write auth/approle/role/vaultagent token_policies="vault-agent"```

5- Récuperation du role id et secret id

```vault read auth/approle/role/vaultagent/role-id```

```vault write -force auth/approle/role/vaultagent/secret-id```


6- Ecrire le role id et secret id dans /tmp/role_id et /tmp/secret_id

7- Lancer l’agent avec la commande : vault agent -config=vault-agent.hcl

8- Récuperation du token généré par l'agent dans /tmp/token

9- Authentification avec ce token et check des secrets dans demo/*
