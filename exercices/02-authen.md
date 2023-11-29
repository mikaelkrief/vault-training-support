Exercice Authentification/Policy



1- creer un engine KV "demo" via  UI


2- creer une policy demo (voir 06) demo.hcl, qui peut lire les secrets KV de demo

path "demo/*" {
  capabilities = ["read", "list"]
}
vault policy write demo demo.hcl


3- Activer l'authentification user/pass

vault auth enable userpass

4- créer un user test et lui attaché la policy "demo"

vault write auth/userpass/users/test password="test" policies="demo"

5- se connecté avec cet utilisateur (cli)

vault login -method="userpass" username="test"

6- Lire les secrets de "secret"

vault kv list secret

??

7- Lire les secrets de "demo"

vault kv list demo

Que vois t-on ?