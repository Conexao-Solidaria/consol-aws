module "vpc_consol" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "10.0.0.0/26"
  vpc_name       = "vpc_consol"
}

module "subnets_consol" {
  source            = "../../modules/vpc/subnets"
  vpc_id            = module.vpc_consol.vpc_id
  vpc_name          = module.vpc_consol.vpc_name
  availability_zone = "${var.region}a"
  cidr_frontend     = "10.0.0.0/28"
  cidr_backend      = "10.0.0.16/28"
  cidr_database     = "10.0.0.32/28"
}

module "igw_consol" {
  source = "../../modules/vpc/internet_gateway"
  vpc_id = module.vpc_consol.vpc_id
  vpc_name = module.vpc_consol.vpc_name
}

module "route_table_consol" {
  source = "../../modules/vpc/route_table"
  vpc_id = module.vpc_consol.vpc_id
  vpc_name = module.vpc_consol.vpc_name
  public_route_cidr_block = "0.0.0.0/0"
  igw_id = module.igw_consol.igw_id
  frontend_subnet_id = module.subnets_consol.subnet_frontend_id
  backend_subnet_id = module.subnets_consol.subnet_backend_id
  database_subnet_id = module.subnets_consol.subnet_database_id
}

module "ec2_frontend" {
  source = "../../modules/ec2/frontend"
  vpc_name = module.vpc_consol.vpc_name
  key_name = var.key_name
  instance_type = "t2.small"
  ami = "ami-0c55b159cbfafe1fe"
  security_group_id = module.ec2_security_group_consol.security_group_id
  frontend_subnet_id = module.subnets_consol.subnet_frontend_id
}
