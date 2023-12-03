

path "demo/*" {
  capabilities = ["read", "list"]
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