resource "aws_instance" "ec2_backend1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet1_id

  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "ec2_backend1"
  }
}

resource "aws_instance" "ec2_backend2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet2_id

  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "ec2_backend2"
  }
}
