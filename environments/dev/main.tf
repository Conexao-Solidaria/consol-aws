module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "10.0.0.0/26"
  vpc_name       = "vpc"
}

module "subnets" {
  source             = "../../modules/vpc/subnets"
  vpc_id             = module.vpc.vpc_id
  vpc_name           = module.vpc.vpc_name
  availability_zone1 = "${var.region}a"
  availability_zone2 = "${var.region}c"
  cidr_frontend      = "10.0.0.0/28"
  cidr_backend       = "10.0.0.16/28"
  cidr_database      = "10.0.0.32/28"
}

module "igw" {
  source   = "../../modules/vpc/internet_gateway"
  vpc_id   = module.vpc.vpc_id
  vpc_name = module.vpc.vpc_name
}

module "route_table" {
  source                  = "../../modules/vpc/route_table"
  vpc_id                  = module.vpc.vpc_id
  vpc_name                = module.vpc.vpc_name
  public_route_cidr_block = "0.0.0.0/0"
  igw_id                  = module.igw.igw_id
  frontend_subnet1_id     = module.subnets.frontend_subnet1_id
  frontend_subnet2_id     = module.subnets.frontend_subnet2_id
  backend_subnet1_id      = module.subnets.backend_subnet1_id
  backend_subnet2_id      = module.subnets.backend_subnet2_id
  database_subnet1_id     = module.subnets.database_subnet1_id
  database_subnet2_id     = module.subnets.database_subnet2_id
}

module "sg_frontend" {
  source = "../../modules/ec2/frontend/security_group"
  vpc_id = module.vpc.vpc_id
}

module "lb_frontend" {
  source    = "../../modules/ec2/frontend/load_balancer"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.subnets.frontend_subnet1_id
  sg_id     = module.sg_frontend.sg_id
}

module "ec2_frontend" {
  source        = "../../modules/ec2/frontend"
  ami_id        = "ami-0866a3c8686eaeeba"
  instance_type = "t2.small"
  subnet1_id    = module.subnets.frontend_subnet1_id
  subnet2_id    = module.subnets.frontend_subnet2_id
  sg_id         = module.sg_frontend.sg_id
  key_name      = var.key_name
}

module "sg_backend" {
  source         = "../../modules/ec2/backend/security_group"
  vpc_id         = module.vpc.vpc_id
  sg_frontend_id = module.sg_frontend.sg_id
}

module "lb_backend" {
  source    = "../../modules/ec2/backend/load_balancer"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.subnets.backend_subnet1_id
  sg_id     = module.sg_backend.sg_id
}

module "ec2_backend" {
  source        = "../../modules/ec2/backend"
  ami_id        = "ami-0866a3c8686eaeeba"
  instance_type = "t2.small"
  subnet1_id    = module.subnets.backend_subnet1_id
  subnet2_id    = module.subnets.backend_subnet2_id
  sg_id         = module.sg_backend.sg_id
  key_name      = var.key_name
}
