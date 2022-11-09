# Installation de la PKI

1. Activation de l'engine PKI pour la Root_CA

vault secrets enable -path=root_ca pki

2. Configuration CA pour 10 ans

vault secrets tune -max-lease-ttl=87600h root_ca

3. Generation du certificat RootCA

vault write -field=certificate root_ca/root/generate/internal common_name="My Root CA" ttl=87600h > CA_cert.crt

4. Configuration de la CA pour url de issuing et de CRL (Certificate Revocation List) 

vault write root_ca/config/urls issuing_certificates="$VAULT_ADDR/v1/pki/ca" crl_distribution_points="$VAULT_ADDR/v1/pki/crl"

5. Activation de l'engine PKI pour la Intermediate CA

vault secrets enable -path=int_ca pki

TTL
vault secrets tune -max-lease-ttl=87600h int_ca

6. Envoie de la CSR (demande de certificat) au root ca, pour générer l' intermiediate certificat

vault write -format=json int_ca/intermediate/generate/internal common_name="My Intermediate CA" | tee (jq -r '.data.csr' > intermediate.csr) (jq -r .data.private_key > intermediate.pem)


7. Creation du cert intermediaire signé par le root

vault write int_ca/intermediate/set-signed certificate=@intermediate.csr