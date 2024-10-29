variable "sg_id" {
  description = "The security group ID for the backend load balancer"
  type        = string
}

variable "subnet1_id" {
  description = "The subnet ID for the backend load balancer"
  type        = string
}

variable "subnet2_id" {
  description = "The subnet ID for the backend load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the backend load balancer"
  type        = string
}

variable "backend_instance1_id" {
  description = "The ID of the first backend instance"
  type        = string
}

variable "backend_instance2_id" {
  description = "The ID of the first backend instance"
  type        = string
}
