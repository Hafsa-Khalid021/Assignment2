variable "project_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "nginx_sg_id" {
  type = string
}

variable "web_sg_id" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
