# Installation de la PKI

1. Activation de l'engine PKI pour la Root_CA

```
vault secrets enable -path=root_ca pki
```

2. Configuration CA pour 10 ans

```
vault secrets tune -max-lease-ttl=87600h root_ca
```

3. Generation du certificat RootCA

```
vault write -field=certificate root_ca/root/generate/internal common_name="rootca" issuer_name="demoroot" ttl=87600h > CA_cert.crt
```

Vérification : liste des issuers

```
vault list root_ca/issuers/
```

4. Configuration de la CA pour url de issuing et de CRL (Certificate Revocation List) 

```
vault write root_ca/config/urls issuing_certificates="$VAULT_ADDR/v1/pki/ca" crl_distribution_points="$VAULT_ADDR/v1/pki/crl"
```

5. Activation de l'engine PKI pour la Intermediate CA

```
vault secrets enable -path=int_ca pki
```

TTL

```
vault secrets tune -max-lease-ttl=87600h int_ca
```

6. Envoie de la CSR (demande de certificat) au root ca, pour générer l' intermediate certificat

```
vault write -format=json int_ca/intermediate/generate/internal common_name="My Intermediate CA" issuer_name="int-dot-com" | jq -r '.data.csr' > pki_intermediate.csr
```

7. Signe le certificat intermediaire avec le Root CA

```
vault write -format=json root_ca/root/sign-intermediate issuer_ref="demoroot" csr=@pki_intermediate.csr format=pem_bundle ttl="43800h" | jq -r '.data.certificate' > intermediate.cert.pem
```

8. Importation du cert intermediaire signé par le root

```
vault write int_ca/intermediate/set-signed certificate=@intermediate.cert.pem
```

9. creation du role qui autorise la generation de cert pour le dom .demo.com

```
vault write int_ca/roles/demo-dot-com issuer_ref="$(vault read -field=default int_ca/config/issuers)" allowed_domains="demo.com" allow_subdomains=true max_ttl="720h"
```

10. Générer un certificat

```
vault write int_ca/issue/demo-dot-com common_name="test.demo.com" ttl="24h"
```