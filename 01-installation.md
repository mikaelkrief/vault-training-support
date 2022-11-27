 # Installation


## Sur Linux
```
apt update && apt install --yes gpg
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
apt update && apt install vault
```

Vérification

```
vault --help
```

## Démmarage du serveur (en mode dev)

```
vault server -dev
```

## Connection au Vault

```
export VAULT_ADDR='http://127.0.0.1:8200'
```

## Vérification du status du serveur

```
vault status
```
