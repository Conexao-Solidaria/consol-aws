module "environment" {
   source = "./environments/dev"
   region = var.region
   key_name = var.key_name
}

