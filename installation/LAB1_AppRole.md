# Policies

1. Créer un fichier myapp.hcl


path "secret/data/myapp/*" {
  capabilities = [ "read" ]
}

2. Crer la policie avec la command 

vault policy write myapp myapp.hcl

3. creer un secret dans le kv avec comme secret dans un fichier data.json

{
  "url": "foo.example.com:35533",
  "db_name": "users",
  "username": "admin",
  "password": "passw0rd"
}

vault kv put secret/myapp/db-config @data.json

=> test avec  vault kv get secret/myapp/db-config


4. Activer l'engine AppRole

vault auth enable approle

5. Creer le role

vault write auth/approle/role/myapp token_policies="myapp" \
      token_ttl=1h token_max_ttl=4h

==> vault read auth/approle/role/myapp