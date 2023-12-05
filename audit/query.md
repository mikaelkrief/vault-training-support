# Exemple de requetes sur le fichier de logs

apt install jq


# Erreurs

jq 'select(.error != null) | [.time,.error]' audit-log.log

# Nb de request et de réponses

jq -n '[inputs | {Operation: .type}] | group_by(.Operation) | map({Operation: .[0].Operation, Count: length}) | .[]' audit-log.log

# Nb de request par identifiant

jq -n '[inputs | {DisplayName: .auth.display_name | select(. != null)} ] | group_by(.DisplayName) | map({DisplayName: .[0].DisplayName, Count: length})  | .[]' audit-log.log

# Nb d'operations

jq -n '[inputs | {Operation: .request.operation} ] | group_by(.Operation) | map({Operation: .[0].Operation, Count: length}) | .[]' audit-log.log

# Nb de request par path

jq -n '[inputs | {Path: .request.path} ] | group_by(.Path) | map({Path: .[0].Path, Count: length}) | sort_by(-.Count) | limit(5;.[])' audit-log.log
