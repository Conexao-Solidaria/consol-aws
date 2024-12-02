variable "ami_id" {
  description = "The AMI ID"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "subnet1_id" {
  description = "The subnet ID"
  type        = string
}

variable "key_name" {
  description = "The key name"
  type        = string
}

variable "sg_id" {
  description = "The security group ID for the frontend"
  type        = string
}
