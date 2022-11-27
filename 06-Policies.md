# Policies


1. Créer une policy qui permet de lire le secret secret_demo

```
path "demo/*" {
  capabilities = ["read", "list"]
}
```

```
vault policy write demo demo.hcl
```

2. Création d'un user/password avec sa policy

```
vault write auth/userpass/users/test password="test" policies="demo"
```

3. S'authentifier avec cet user

```
vault login -method="userpass" username="test"
```

4. Check des policies


```vault kv list secret``` =+> 403

```vault kv list demo``` ==> OK

UI


5. Modifier la policy en rajoutant des droits

```
path "secret/data/app1/api" {
  capabilities = ["read", "create", "update"]
}
```

==> authentiofication et test
==> voir les authorisation sur l'UI (pas de delete)

6. Verifier

```
vault token capabilities <your token> <path>
```
