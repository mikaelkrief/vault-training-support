path "demo/*" {
  capabilities = ["read", "list"]
}


path "secret/demo/app" {
  capabilities = ["read", "create", "update"]
}
