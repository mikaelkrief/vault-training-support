# Exercices sur les tokens

1- Se connecter avec l'utilisateur (à part le root) qui a les droits de manipuler les tokens sachant que la policy pour la gestion des tokens est :

```
path "auth/token/create" {
  capabilities = ["create", "update"]
}
```

2- Créer un nouveau token qui aura un expiration de 3 min et lui attribuer la policy "demo"

3- Se conecter avec ce token

4- Lister les secrets qui se trouvent dans les kv 'demo' et dans 'secret'

5- Se reconnecter avec le même token apres 3 min


