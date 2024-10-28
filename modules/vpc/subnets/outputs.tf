output "frontend_subnet_id" {
  value       = aws_subnet.subnet_frontend.id
  description = "The ID of the Frontend Subnet"
}

output "backend_subnet_id" {
  value       = aws_subnet.subnet_backend.id
  description = "The ID of the Backend Subnet"
}

output "database_subnet_id" {
  value       = aws_subnet.subnet_database.id
  description = "The ID of the Database Subnet"
}
