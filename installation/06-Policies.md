# Policies


1. Creer une policy qui permet de lire le secret secret_demo


path "demo/*" {
  capabilities = ["read", "list"]
}

vault policy write demo demo.hcl

2. Creation user/password avec sa policy

vault write auth/userpass/users/test password="test" policies="demo"

3. s'authentifier 

vault login -method="userpass" username="test"

4. check des policies

vault kv list secret =+> 403

vault kv list demo ==> OK

UI


5. modifier la policy en rajoutant


path "secret/data/app1/api" {
  capabilities = ["read", "create", "update"]
}

==> authentiofication et test
==> voir les authorisation sur l'UI (pas de delete)

6. Verifier

vault token capabilities <your token> <path>