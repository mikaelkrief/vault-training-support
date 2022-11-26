# Vault API

## TOKEN

- vault token lookup


curl --request POST 'http://vault1.westeurope.cloudapp.azure.com:8200/v1/auth/token/lookup' --header 'X-Vault-Token: root'

utilisation de JQ

resp=$(curl --request POST 'http://vault1.westeurope.cloudapp.azure.com:8200/v1/auth/token/lookup' --header 'X-Vault-Token: root')
echo $resp | jq .

- Se creer un nouveau token

curl --request POST 'http://vault1.westeurope.cloudapp.azure.com:8200/v1/auth/token/create' --header 'X-Vault-Token: root' 

echo $resp | jq .auth.client_token


# SECRET

- creer un nouveau secret

curl  --header "X-Vault-Token: root"  --request POST  --data '{ "data": {"password": "my-long-password"} }'  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/data/testok | jq -r ".data"


- list des secrets

curl --header "X-Vault-Token: root"  --request GET  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/metadata/?list=true


-  info du secrets

curl --header "X-Vault-Token: root"  --request GET  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/data/testok

specifique version

curl --header "X-Vault-Token: root"  --request GET  http://vault1.westeurope.cloudapp.azure.com:8200/v1/demo/data/testok?version=1