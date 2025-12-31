variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "me-central-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "assignment2"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
}
