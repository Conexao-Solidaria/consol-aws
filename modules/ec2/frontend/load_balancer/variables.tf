variable "sg_id" {
  description = "The security group ID for the frontend load balancer"
  type        = string
}

variable "subnet1_id" {
  description = "The subnet ID for the frontend load balancer"
  type        = string
}

variable "subnet2_id" {
  description = "The subnet ID for the frontend load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the frontend load balancer"
  type        = string
}

variable "frontend_instance1_id" {
  description = "The ID of the first frontend instance"
  type        = string
}

variable "frontend_instance2_id" {
  description = "The ID of the first frontend instance"
  type        = string
}
