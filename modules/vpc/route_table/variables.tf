variable "public_route_cidr_block" {
  description = "The route to the internet gateway"
  type        = string
}

variable "igw_id" {
  description = "The ID of the internet gateway"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the NAT gateway"
  type        = string
}

variable "vpc_name" {
  description = "The name of the NAT gateway"
  type        = string
}

variable "frontend_subnet_id" {
  description = "The ID of the frontend subnet"
  type        = string
}

variable "backend_subnet_id" {
  description = "The ID of the backend subnet"
  type        = string
}

variable "database_subnet_id" {
  description = "The ID of the database subnet"
  type        = string
}
