resource "aws_route_table" "rt_public_consol" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.public_route_cidr_block
    gateway_id = var.igw_id
  }

  tags = {
    Name = "rt-${var.vpc_name}public"
  }
}

resource "aws_route_table_association" "public_subnet_frontend" {
  subnet_id      = var.frontend_subnet_id
  route_table_id = aws_route_table.rt_public_consol.id
}

resource "aws_route_table" "rt_private_consol" {
  vpc_id = var.vpc_id

  tags = {
    Name = "rt-${var.vpc_name}private"
  }
}

resource "aws_route_table_association" "private_subnet_backend" {
  subnet_id      = var.backend_subnet_id
  route_table_id = aws_route_table.rt_private_consol.id
}

resource "aws_route_table_association" "private_subnet_database" {
  subnet_id      = var.database_subnet_id
  route_table_id = aws_route_table.rt_private_consol.id
}
