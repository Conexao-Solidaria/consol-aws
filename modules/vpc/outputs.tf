output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "The ID of the VPC"
}

output "vpc_name" {
  value       = aws_vpc.vpc.tags["Name"]
  description = "The name of the VPC"
}
