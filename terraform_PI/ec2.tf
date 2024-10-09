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