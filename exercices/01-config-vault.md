
Exercice : Configuration de Vault en Raft


Nous devons créer un fichier de configuration de Vault qui contient ces caractéristiques:

- Type of the Storage Backend: Integrated Storage(Raft)

- Path for the data storage: ./vault/data

- Node ID for this server would be: vault1

- activation de l'UI

- tcp adress: 127.0.0.1:8200 , et tls désactivé
- api adress port : 8200
- cluster addr port : 8201


Puis démarrer le cluster en mode dev avec cette configuration

Verifier la présence du fichier raft dans vault/data

Lancer l'UI de Vault et connectez vous avec votre token root