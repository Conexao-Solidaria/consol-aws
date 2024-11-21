variable "cidr_frontend1" {
  type        = string
  description = "The CIDR block for the frontend subnet"
}

variable "cidr_backend1" {
  type        = string
  description = "The CIDR block for the backend subnet"
}

variable "cidr_database1" {
  type        = string
  description = "The CIDR block for the database subnet"
}

variable "cidr_frontend2" {
  type        = string
  description = "The CIDR block for the frontend subnet"
}

variable "cidr_backend2" {
  type        = string
  description = "The CIDR block for the backend subnet"
}

variable "cidr_database2" {
  type        = string
  description = "The CIDR block for the database subnet"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "availability_zone1" {
  type        = string
  description = "The availability zone for the subnet"
}

variable "availability_zone2" {
  type        = string
  description = "The availability zone for the subnet"
}
