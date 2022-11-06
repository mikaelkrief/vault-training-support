# transit


1. Activation du engine Transit

vault secrets enable transit


2.  Creation d'un clé d'encryption

vault write -f transit/keys/mykey


3. Encryption d'un secret

vault write transit/encrypt/mykey plaintext=$(echo "test123*" | base64)

==> récupération de la value <VAL>

4. Decryption 

vault write transit/decrypt/mykey ciphertext=<VAL>

5. Base64 Decode du retour du decryptage

echo <D> | base64 -d


6. Script global


val=$(vault write -field=ciphertext transit/encrypt/mykey plaintext=$(echo "test123*" | base64))
t=$(vault write -field=plaintext transit/decrypt/mykey ciphertext=$val)
echo $t | base64 -d