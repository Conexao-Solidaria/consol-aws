output "sg_id" {
  description = "The security group ID for the database"
  value = aws_security_group.sg_database.id
}
