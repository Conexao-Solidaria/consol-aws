output "frontend_subnet1_id" {
  value       = aws_subnet.subnet_frontend1.id
  description = "The ID of the Frontend Subnet"
}

output "backend_subnet1_id" {
  value       = aws_subnet.subnet_backend1.id
  description = "The ID of the Backend Subnet"
}

output "database_subnet1_id" {
  value       = aws_subnet.subnet_database1.id
  description = "The ID of the Database Subnet"
}

output "frontend_subnet2_id" {
  value       = aws_subnet.subnet_frontend2.id
  description = "The ID of the Frontend Subnet"
}

output "backend_subnet2_id" {
  value       = aws_subnet.subnet_backend2.id
  description = "The ID of the Backend Subnet"
}

output "database_subnet2_id" {
  value       = aws_subnet.subnet_database2.id
  description = "The ID of the Database Subnet"
}
