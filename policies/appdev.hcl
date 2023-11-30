

path "demo/*" {
  capabilities = ["read", "list"]
}


path "secret/data/app1" {
  capabilities = ["read", "create", "update"]
}


# Create, read, and update secrets engines
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update"]
}
# List existing secrets engines.
path "sys/mounts"
{
  capabilities = ["read"]
}