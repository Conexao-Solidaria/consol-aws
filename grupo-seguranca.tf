resource "aws_security_group" "sg_consol_iac" {
    name = "sg_consol_iac"
    vpc_id = aws_vpc.vpc_consol.id

    ingress {
        from_port = var.porta_http
        to_port = var.porta_http
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = var.porta_http
        to_port = var.porta_http
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}