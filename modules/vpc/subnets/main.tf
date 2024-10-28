resource  "aws_subnet" "subnet_frontend1" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_frontend
  availability_zone = var.availability_zone1

  tags = {
    Name = "subnet-${var.vpc_name}-frontend1"
  }
}

resource  "aws_subnet" "subnet_backend1" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_backend
  availability_zone = var.availability_zone1

  tags = {
    Name = "subnet-${var.vpc_name}-backend1"
  }
}

resource  "aws_subnet" "subnet_database1" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_database
  availability_zone = var.availability_zone1

  tags = {
    Name = "subnet-${var.vpc_name}-database1"
  }
}

resource  "aws_subnet" "subnet_frontend2" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_frontend
  availability_zone = var.availability_zone2

  tags = {
    Name = "subnet-${var.vpc_name}-frontend2"
  }
}

resource  "aws_subnet" "subnet_backend2" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_backend
  availability_zone = var.availability_zone2

  tags = {
    Name = "subnet-${var.vpc_name}-backend2"
  }
}

resource  "aws_subnet" "subnet_database2" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_database
  availability_zone = var.availability_zone2

  tags = {
    Name = "subnet-${var.vpc_name}-database2"
  }
}
