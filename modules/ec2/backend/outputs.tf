output "ec2_backend1_instance_id" {
  value = aws_instance.ec2_backend1.id
  description = "The ID of the first backend instance"
}

output "ec2_backend2_instance_id" {
  value = aws_instance.ec2_backend2.id
  description = "The ID of the first backend instance"
}
