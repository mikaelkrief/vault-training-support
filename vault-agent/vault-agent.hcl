pid_file = "./pidfile"

vault {
   address = "http://0.0.0.0:8200"
   tls_skip_verify = true
}

auto_auth {
  method "approle" {
    mount_path = "auth/approle"
    config = {
      role_id_file_path   = "/tmp/role_id"
      secret_id_file_path = "/tmp/secret_id"
      remove_secret_id_file_after_reading = false
    }
  }
   sink "file" {
      config = {
            path = "/tmp/token"
      }
   }
}
