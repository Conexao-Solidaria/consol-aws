terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

//VPC --------------------------------------------------------------

resource "aws_vpc" "vpc_consol" {
    cidr_block = "10.10.10.0/24"

    tags = {
      name = "vpc_consol"
    }
}

//SUBNET --------------------------------------------------------------

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

//GRUPO DE SEGURANÇA --------------------------------------------------------------

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


// CHAVE PRIVADA --------------------------
resource "tls_private_key" "chave" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "chave_gerada" {
  key_name   = var.key_name
  public_key = tls_private_key.chave.public_key_openssh
}


//INSTÂNCIA --------------------------------------------------------------

resource "aws_instance" "ec2_publica" {
    ami = "ami-0e86e20dae9224db8"
    instance_type = "t2.micro"

    tags = {
        Name = "ec2_publica"
    }

    ebs_block_device { //disco
      device_name = "/dev/sda1"
      volume_size = 10
      volume_type = "gp3"
    }

    key_name = aws_key_pair.chave_gerada.key_name

    subnet_id = aws_subnet.subnet_publica.id

    security_groups = [ aws_security_group.sg_consol_iac.id ]
}



resource "aws_instance" "ec2_privada" {
    ami = "ami-0e86e20dae9224db8"
    instance_type = "t2.micro"

    tags = {
        Name = "ec2_privada"
    }

    ebs_block_device { //disco
      device_name = "/dev/sda1"
      volume_size = 10
      volume_type = "gp3"
    }

    key_name = aws_key_pair.chave_gerada.key_name
    
    subnet_id = aws_subnet.subnet_privada.id

    security_groups = [ aws_security_group.sg_consol_iac.id ]
}