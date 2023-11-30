echo "Creation des engines KV"

vault secrets enable -path=demo -version=2 kv
vault secrets enable -path=secret/api -version=2 kv

echo "Creation des secrets"


vault kv put demo/secret1 test=password
vault kv put secret/api/apikey key=azerty123*



echo "Creations des policies"

vault policy write admin policies/admin.hcl
vault policy write demo policies/appdev.hcl



echo "Creation de l'enthent userapp avec 2 users"


vault auth enable userpass
vault write auth/userpass/users/user1 password="test" policies="demo"
vault write auth/userpass/users/user2 password="test" policies="admin"