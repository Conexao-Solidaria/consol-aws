resource  "aws_subnet" "subnet_frontend" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_frontend
  availability_zone = var.availability_zone

  tags = {
    Name = "subnet-${var.vpc_name}-frontend"
  }
}

resource  "aws_subnet" "subnet_backend" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_backend
  availability_zone = var.availability_zone

  tags = {
    Name = "subnet-${var.vpc_name}-backend"
  }
}

resource  "aws_subnet" "subnet_database" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_database
  availability_zone = var.availability_zone

  tags = {
    Name = "subnet-${var.vpc_name}-database"
  }
}
