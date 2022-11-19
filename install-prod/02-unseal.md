# Unseal

Dans un nouveau terminal
export VAULT_ADDR='http://127.0.0.1:8200'

1- Check du status

vault status

==> sealed true

2- init du vault

vault operator init > key.txt

recupérartion des clé dans le fichiers key.txt

pour voir le fichier cat key.txt

3- unseal

vault operator unseal $(grep 'Key 1:' key.txt | awk '{print $NF}')

vault operator unseal $(grep 'Key 2:' key.txt | awk '{print $NF}')

vault operator unseal $(grep 'Key 3:' key.txt | awk '{print $NF}')

4- check

vault status

==> sealed false


5- list des engines

recupération du token root dans le key.txt

vault login <token>

vault secrets list