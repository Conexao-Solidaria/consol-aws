output "sg_id" {
  description = "The security group ID for the frontend"
  value = aws_security_group.sg_frontend.id
}
