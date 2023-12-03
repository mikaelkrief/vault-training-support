# TP Authentification/Policy


S'authentifier avec le token root

1- Créer un engine KV "demo" via  UI ou via la comamde 

vault secrets enable -path=demo -version=2 kv

a- Puis créer un secret dans cet engine

vault kv put demo/secret1 test=password

b- Créer un second secret dans le kv 'secret'

vault kv put secret/secret2 test=password

2- Créer une policy demo (voir 06) demo.hcl, qui peut lire les secrets KV de demo


3- Activer l'authentification user/pass avec le cli


4- Créer un user 'test' et lui attaché la policy "demo"


5- Se connecté avec cet utilisateur (cli)


6- Lire les secrets de "secret"

Résultat ?

7- Lire les secrets de "demo"

Que vois t-on ?