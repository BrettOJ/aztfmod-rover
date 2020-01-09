resource "tls_private_key" "key" {
  algorithm   = "RSA"
  ecdsa_curve = "P224"
  rsa_bits    = "2048"
}