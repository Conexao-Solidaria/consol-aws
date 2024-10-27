variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc_name" {
  default     = "vpc_consol"
  type        = string
  description = "The name of the VPC"
}
