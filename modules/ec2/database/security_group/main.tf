resource "aws_security_group" "sg_database" {
  name        = "sg_banco-de-dados"
  description = "Security group for Consol database"
  vpc_id      = var.vpc_id

  tags = {
    Name = "sg_banco-de-dados"
  }

  ingress {
    description = "Allow MySQL access from Spring Boot application"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups =  [var.sg_backend_id]
  }

  ingress {
    description = "Allow SSH from frontend"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.sg_frontend_id]
  }

  ingress {
    description     = "Allow HTTP from frontend"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [var.sg_frontend_id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
