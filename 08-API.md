# Vault API

## TOKEN

cli :``` vault token lookup```

```
curl --request POST 'http://vault1.westeurope.cloudapp.azure.com:8200/v1/auth/token/lookup' --header 'X-Vault-Token: root'
```

Utilisation de JQ

```
resp=$(curl --request POST 'http://vault1.westeurope.cloudapp.azure.com:8200/v1/auth/token/lookup' --header 'X-Vault-Token: root')
echo $resp | jq .
```

- Créer un nouveau token

```
curl --request POST 'http://vault1.westeurope.cloudapp.azure.com:8200/v1/auth/token/create' --header 'X-Vault-Token: root' 

echo $resp | jq .auth.client_token
```

## SECRET

- Créer un nouveau secret
```
curl  --header "X-Vault-Token: root"  --request POST  --data '{ "data": {"password": "my-long-password"} }'  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/data/testok | jq -r ".data"
```

- Liste des secrets

```
curl --header "X-Vault-Token: root"  --request GET  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/metadata/?list=true
```

-  Info du secrets

```
curl --header "X-Vault-Token: root"  --request GET  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/data/testok
```

- Specifique version

```
curl --header "X-Vault-Token: root"  --request GET  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/data/testok?version=1
```
