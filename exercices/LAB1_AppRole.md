# Lab AppRole

## Policies

1. Créer un fichier myapp.hcl

```
path "secret/data/myapp/*" {
  capabilities = [ "read" ]
}
```

2. Créér la policy avec la commande:

```
vault policy write myapp myapp.hcl
```

3. créer un secret dans le kv avec comme secret dans un fichier data.json

```
{
  "url": "foo.example.com:35533",
  "db_name": "users",
  "username": "admin",
  "password": "passw0rd"
}
```
```
vault kv put secret/myapp/db-config @data.json
```

=> test avec  ```vault kv get secret/myapp/db-config```

## Engine AppRole

4. Activer l'engine AppRole

```
vault auth enable approle
```
5. Creer le role

```
vault write auth/approle/role/myapp token_policies="myapp" token_ttl=3h token_max_ttl=4h
```

==> ```vault read auth/approle/role/myapp```

## RoleId et SecretID

6. Récupération du RoleID

```
vault read auth/approle/role/myapp/role-id
```

7. Création d'un SecretID

```
vault write -force auth/approle/role/myapp/secret-id
```

8. Login avec le AppRole

```
vault write auth/approle/login role_id="85d58b05-f6f0-a5f2-78b8-73de72f3877e" secret_id="c7473027-24df-7856-f15b-f1326471f6d2"
```
```
vault login <token>
```

9. Récupération du secret

```
vault kv get secret/myapp/db-config
```
