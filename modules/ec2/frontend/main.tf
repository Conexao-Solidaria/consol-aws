resource "aws_instance" "consol" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.frontend_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  tags = {
    Name = "ec2-${var.vpc_name}-consol"
  }
}
