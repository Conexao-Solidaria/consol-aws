resource "aws_subnet" "subnet_publica" {
    tags = {
      Name = "subrede_publica"
    }
    vpc_id = aws_vpc.vpc_consol.id
    cidr_block = "10.10.10.0/28"

    map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_privada" {
    tags = {
      Name = "subrede_privada"
    }

    vpc_id = aws_vpc.vpc_consol.id
    cidr_block = "10.10.10.16/28"
}