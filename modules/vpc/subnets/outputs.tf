output "frontend_subnet_id" {
  value       = aws_subnet.frontend_subnet.id
  description = "The ID of the Frontend Subnet"
}

output "backend_subnet_id" {
  value       = aws_subnet.backend_subnet.id
  description = "The ID of the Backend Subnet"
}

output "database_subnet_id" {
  value       = aws_subnet.database_subnet.id
  description = "The ID of the Database Subnet"
}
