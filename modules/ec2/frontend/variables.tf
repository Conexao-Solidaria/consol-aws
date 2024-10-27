#  ami = var.ami
#  instance_type = var.instance_type
#  key_name = var.key_name
#  subnet_id = var.frontend_subnet_id
#  vpc_security_group_ids = [var.security_group_id]
#  associate_public_ip_address = true
#  tags = {
#    Name = "${var.vpc_name}-consol"
#  }

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instance"
  type        = string
}

variable "key_name" {
  description = "The key pair to use for the instance"
  type        = string
}

variable "frontend_subnet_id" {
  description = "The security group to use for the instance"
  type        = string
}

variable "security_group_id" {
  description = "The security group to use for the instance"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}
