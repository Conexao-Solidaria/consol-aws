output "ec2_banco-de-dados_instance_id" {
  value = aws_instance.ec2_database.id
  description = "The ID of the database instance"
}
