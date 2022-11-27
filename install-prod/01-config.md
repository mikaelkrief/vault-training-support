# Installer vault
Installation du binaire


# Configuration

1- Créer un fichier de configuration ```vautlconfig.hcl```

```
storage "raft" {
  path    = "./vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}

api_addr = "http://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8201"
ui = true
```

2- Créer le dossier vault/data qui va contenir le backend raft

```
mkdir -p vault/data
```

3- Demmarrer vault avec command

```
vault server -config=vaultconfig.hcl
```
