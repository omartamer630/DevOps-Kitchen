output "private_key_pem" {
  value     = tls_private_key.forgtech_key.private_key_pem
  sensitive = true
}
