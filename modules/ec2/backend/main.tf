resource "aws_instance" "ec2_backend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "ec2_frontend"
  }
}
