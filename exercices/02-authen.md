1- creer une policy demo (voir 06), qui peut lire les secrets KV de demo

1- Activer l'authentification user/pass

vault auth enable userpass

2 - créer un user test et lui attaché la policy "demo"

vault write auth/userpass/users/test password="test" policies="demo"
