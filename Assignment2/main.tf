terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region =  var.region
}

module "networking" {
  source = "./modules/networking"

  aws_region          = var.region
  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  common_tags        = local.common_tags
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
   common_tags  = local.common_tags
}

# Nginx Server
#module "nginx_server" {
  #source            = "./modules/webserver"
  #env_prefix        = var.env_prefix
  #instance_name     = "nginx-proxy"
  #instance_type     = var.instance_type
 # availability_zone = var.availability_zone
 # vpc_id            = module.networking.vpc_id
 # subnet_id         = module.networking.subnet_id
 # security_group_id = module.security.nginx_sg_id
 # public_key        = var.public_key
 # script_path       = "./scripts/nginx-setup.sh"
 # instance_suffix   = "nginx"
 # common_tags       = local.common_tags
#}

# Nginx Server
module "nginx_server" {
  source            = "./modules/webserver"
  project_name      = var.project_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
 # public_subnet_id  = module.networking.subnet_id   # your module expects `public_subnet_id`
  public_subnet_id = module.networking.public_subnet_id
  key_pair_name     = var.key_pair_name
  nginx_sg_id       = module.security.nginx_sg_id
 # web_sg_id         = module.security.web_sg_id
   common_tags      = local.common_tags
}


# Backend Servers
#module "backend_servers" {
  #for_each = { for idx, server in local.backend_servers : server.name => server }

  #source            = "./modules/webserver"
  #env_prefix        = var.env_prefix
  #instance_name     = each.value.name
  #instance_type     = var.instance_type
  #availability_zone = var.availability_zone
  #vpc_id            = module.networking.vpc_id
  #subnet_id         = module.networking.subnet_id
  #security_group_id = module.security.web_sg_id  # corrected
  #public_key        = var.public_key
  #script_path       = each.value.script_path
  #instance_suffix   = each.value.suffix
 # common_tags       = local.common_tags
#}

module "backend_servers" {
 # for_each = { for idx, server in local.backend_servers : server.name => server }

  for_each = {
  web-1 = {
    name = "web-1"
  }
}
 

  source           = "./modules/webserver"
  project_name     = var.project_name
  ami_id           = var.ami_id
  instance_type    = var.instance_type
#  public_subnet_id = module.networking.subnet_id
  public_subnet_id = module.networking.public_subnet_id

  key_pair_name    = var.key_pair_name
#  nginx_sg_id      = module.security.nginx_sg_id
  web_sg_id        = module.security.web_sg_id
   common_tags      = local.common_tags
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = compact([var.nginx_sg_id, var.web_sg_id])  # only non-null SGs

  tags = merge(
    {
      Name = var.project_name
    },
    var.common_tags
  )
}
