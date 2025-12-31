variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "common_tags" {
  type = map(string)
  description = "Common tags to assign to all AWS resources in the networking module"
}
