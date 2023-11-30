
Exercice : Configuration de Vault en Raft


1- Nous devons créer un fichier de configuration de Vault (vault.hcl) qui contient ces caractéristiques:

- Type of the Storage Backend: Integrated Storage(Raft)

- Path for the data storage: ./vault/data

- Node ID for this server would be: vault1

- activation de l'UI

- tcp adress: 0.0.0.0:8200 , et tls désactivé
- api adress port : 8200
- cluster addr port : 8201


2- Puis démarrer le cluster avec cette configuration

3- Verifier la présence du fichier raft dans vault/data

4- Faire afficher le status du vault


Que manque gt'il pour que le vault soit opérationnel ?


Optionnel: Lancer l'UI de Vault (lien dans step2)

