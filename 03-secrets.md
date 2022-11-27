# Gestion des secrets



## Créer un secret

```
vault kv put secret/secret1 test=password
```

```
vault kv put secret/app1/api key=azerty123*
```

Avec un fichier Json

user.json

```
{
  "login": "admin",
  "password": "test123*"
}
vault kv put secret/app1/front @user.json
```

# Lister les secrets

```
vault kv list secret
```


## Créer un engine kv demo via UI

```
vault secrets list
vault kv put demo/secret_demo test=password
vault kv list demo
```

## Récuperer les details d'un secret

```
vault kv get secret/secret1
```

Récuperer que la value
```
vault kv get -field=test secret/secret1
```
-> au format json
```
vault kv get -format=json secret/secret1
```

puis utiliser JQ


## Ajouter une version d'un secret

```
vault kv put secret/secret1 test=password123*
```

==> voir le detail du secret (version=2)
    
```
vault kv put secret/secret1 test=test123test*
```

## Voir la version d'un secret
```
vault kv get --version=1 secret/secret1
```
## Supprimer la version d'un secret
```
vault kv delete -versions=2 secret/secret1
```
Pour annuler:
```
vault kv undelete -versions=2 secret/secret1
```

Pour supprimer definitivement une version
```
vault kv destroy -versions=2 secret/secret1
```
## Supprimer un secret
```
vault kv metadata delete secret/secret1
```
