path "demo/*" {
  capabilities = ["read", "list"]
}


path "secret/app" {
  capabilities = ["read", "create", "update"]
}