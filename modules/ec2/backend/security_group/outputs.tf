output "sg_id" {
  description = "The security group ID for the backend"
  value = aws_security_group.sg_backend.id
}
