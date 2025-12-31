# Project
project_name = "assignment2"
environment  = "dev"

# Region
aws_region = "me-central-1"

# EC2
instance_type = "t4g.micro"

# 🔴 VERY IMPORTANT
# Put the AMI ID YOU CREATED in AWS (ARM based)
ami_id = "ami-0xxxxxxxxxxxxxxx"

# Key pair (already exists in AWS)
key_pair_name = "assignment-2"

# Networking
vpc_cidr        = "10.0.0.0/16"
public_subnet   = "10.0.1.0/24"

# Backend servers
web_instance_count = 3

# Common tags
common_tags = {
  Project     = "Assignment2"
  Environment = "Dev"
  Owner       = "Hafsa"
}

