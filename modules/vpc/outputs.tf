output "vpc_id" {
  value       = aws_vpc.vpc_consol.id
  description = "The ID of the VPC"
}

output "vpc_name" {
  value       = aws_vpc.vpc_consol.tags["Name"]
  description = "The name of the VPC"
}
