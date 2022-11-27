# Unseal

Dans un nouveau terminal
```export VAULT_ADDR='http://127.0.0.1:8200'```

1. Check du status

```vault status```

==> sealed true

2. Initialisation du vault

```vault operator init > key.txt```

Récupérartion des clés dans le fichiers key.txt

pour voir le fichier ```cat key.txt```

3. Unseal

```
vault operator unseal $(grep 'Key 1:' key.txt | awk '{print $NF}')

vault operator unseal $(grep 'Key 2:' key.txt | awk '{print $NF}')

vault operator unseal $(grep 'Key 3:' key.txt | awk '{print $NF}')
```

4. Check

```
vault status
```

==> sealed false


5. Liste des engines

Recupération du token root dans le key.txt
```
vault login <token>

vault secrets list
```
