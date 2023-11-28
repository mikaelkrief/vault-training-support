mkdir -p /opt/vault/data
cd /opt/vault
tee config.hcl <<EOF
ui = true
disable_mlock = true

storage "raft" {
  path    = "/opt/vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "true"
}

api_addr = "http://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8201"
EOF

vault server -dev -config=config.hcl
