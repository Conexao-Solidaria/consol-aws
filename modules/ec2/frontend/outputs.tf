output "ec2_frontend1_instance_id" {
  value = aws_instance.ec2_frontend1.id
  description = "The ID of the first frontend instance"
}

output "ec2_frontend2_instance_id" {
  value = aws_instance.ec2_frontend2.id
  description = "The ID of the first frontend instance"
}
