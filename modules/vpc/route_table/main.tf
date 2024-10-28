resource "aws_route_table" "rt_public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.public_route_cidr_block
    gateway_id = var.igw_id
  }

  tags = {
    Name = "rt-${var.vpc_name}-public"
  }
}

resource "aws_route_table_association" "public_subnet_frontend" {
  subnet_id      = var.frontend_subnet_id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_eip" "nat_eip" {
  tags = {
    Name = "NAT EIP"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.frontend_subnet_id

  tags = {
    Name = "NAT Gateway"
  }
}

resource "aws_route_table" "rt_private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "rt-${var.vpc_name}-private"
  }
}

resource "aws_route_table_association" "private_subnet_backend" {
  subnet_id      = var.backend_subnet_id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "private_subnet_database" {
  subnet_id      = var.database_subnet_id
  route_table_id = aws_route_table.rt_private.id
}
