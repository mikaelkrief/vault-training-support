# Authentification

## Authentification avec token root
```
export VAULT_TOKEN="root"
```

## Informations sur le token en cours

```
vault token lookup
```

## Authentification avec le cli

```
vault login <token>
```

## Creation d'un nouveau token 

```
vault token create
```

## Revoker un token

```
vault token revoke <your token>
```
