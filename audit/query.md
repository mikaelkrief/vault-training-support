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

# Nb par erreur

jq -n '[inputs | {Errors: .error} ] | group_by(.Errors) | map({Errors: .[0].Errors, Count: length}) | sort_by(-.Count) | .[]' audit-log.log

# Nb par IP

jq -n '[inputs | {RemoteAddress: .request.remote_address} ] | group_by(.RemoteAddress) | map({RemoteAddress: .[0].RemoteAddress, Count: length}) | .[]' audit-log.log


# Path par Ip

jq -s 'group_by(.request.remote_address) | map({"remote_address": .[0].request.remote_address,"access": (group_by(.request.path) | map({"key":.[0].request.path,"value":length}) | from_entries)})'  audit-log.log
