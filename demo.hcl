path "demo/*" {
  capabilities = ["read", "list"]
}


path "secret/data/app1/api" {
  capabilities = ["read", "create", "update"]
}