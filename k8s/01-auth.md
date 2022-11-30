# Authentifictaion K8S

1- Créer un cluster role binding

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: role-tokenreview-binding
  namespace: default
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: system:auth-delegator
subjects:
- kind: ServiceAccount
  name: vault-auth
  namespace: default
```

2- Créer un service-account

kubectl -n default create serviceaccount vault-auth

3- Appliquer le cluster role binding

kubectl apply -f crb.yaml -n default

4- Export des infos de connection

==> Set VAULT_SA_NAME to the service account you created earlier
export VAULT_SA_NAME=$(kubectl -n default get sa vault-auth -o jsonpath="{.secrets[*]['name']}")

==> Set SA_JWT_TOKEN value to the service account JWT used to access the TokenReview API
export SA_JWT_TOKEN=$(kubectl -n default get secret $VAULT_SA_NAME -o jsonpath="{.data.token}" | base64 --decode; echo)

==> Set SA_CA_CRT to the PEM encoded CA cert used to talk to Kubernetes API
export SA_CA_CRT=$(kubectl -n default get secret $VAULT_SA_NAME -o jsonpath="{.data['ca\.crt']}" | base64 --decode; echo)

==> set the url k8s endpoint

export K8S_HOST="https://test-k8s-54c2f446.hcp.westeurope.azmk8s.io"


5- Configuration auth k8s

vault auth enable kubernetes

vault write auth/kubernetes/config token_reviewer_jwt="$SA_JWT_TOKEN" kubernetes_host="$K8S_HOST" kubernetes_ca_cert="$SA_CA_CRT"

vault write auth/kubernetes/role/myapp bound_service_account_names=default bound_service_account_namespaces='*' policies=myapp ttl=1440h

6- test dans un pod

kubectl create ns testapp
kubectl run nginx --image=nginx -n testapp

kubectl exec -n testapp --stdin=true --tty=true nginx -- /bin/sh

export VAULT_ADDR="http://vault1.westeurope.cloudapp.azure.com:8200/"
export KUBE_TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

curl --request POST --data '{"jwt": "'"$KUBE_TOKEN"'", "role": "myapp"}' ${VAULT_ADDR}v1/auth/kubernetes/login

