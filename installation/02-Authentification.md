# authentification avec token root

export VAULT_TOKEN="root"

# informations sur le token en cours

vault token lookup


# Authetntification avec le cli

vault login root


# Creation d'un nouveau token 

vault token ccreate


# Revoker un token

vault token revoke <your token>