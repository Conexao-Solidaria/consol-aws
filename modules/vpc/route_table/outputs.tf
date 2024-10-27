output "rt_public_consol_id" {
  value = aws_route_table.rt_public_consol.id
  description = "The ID of the Public Route Table"
}

output "rt_private_consol_id" {
  value = aws_route_table.rt_private_consol.id
  description = "The ID of the Private Route Table"
}
