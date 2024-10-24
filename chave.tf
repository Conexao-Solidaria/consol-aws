resource "tls_private_key" "chave" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "chave_gerada" {
  key_name   = var.key_name
  public_key = tls_private_key.chave.public_key_openssh
}