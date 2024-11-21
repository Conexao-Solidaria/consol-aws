output "rt_public_id" {
  value = aws_route_table.rt_public.id
  description = "The ID of the Public Route Table"
}

output "rt_private_id" {
  value = aws_route_table.rt_private.id
  description = "The ID of the Private Route Table"
}
