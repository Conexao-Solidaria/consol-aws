resource "aws_internet_gateway" "igw_consol" {
  vpc_id = var.vpc_id

  tags = {
    Name = "igw-${var.vpc_name}-consol"
  }
}
