variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "sg_frontend_id" {
  description = "The security group ID for the frontend"
  type        = string
}

variable "sg_backend_id" {
  description = "The security group ID for the backend"
  type        = string
}