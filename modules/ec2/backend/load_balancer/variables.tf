variable "sg_id" {
  description = "The security group ID for the backend load balancer"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the backend load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the backend load balancer"
  type        = string
}
