resource "aws_vpc" "vpc_consol" {
    cidr_block = "10.10.10.0/24"

    tags = {
      name = "vpc_consol"
    }
}