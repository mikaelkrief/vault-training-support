## Installation sur AKS 

helm install vault hashicorp/vault --set='ui.enabled=true' --set='ui.serviceType=LoadBalancer' --set "server.dev.enabled=true" --namespace vault1


