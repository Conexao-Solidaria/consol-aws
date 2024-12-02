resource "aws_instance" "ec2_database" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet1_id
  key_name      = var.key_name

  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "ec2-database"
  }
}
