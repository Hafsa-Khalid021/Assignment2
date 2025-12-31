output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "nginx_sg_id" {
  value = module.security.nginx_sg_id
}

output "web_sg_id" {
  value = module.security.web_sg_id
}

# Nginx Server Outputs
output "nginx_public_ip" {
  description = "Public IP of the Nginx server"
  value       = module.nginx_server.public_ip
}

output "nginx_instance_id" {
  description = "Instance ID of the Nginx server"
  value       = module.nginx_server.instance_id
}

# Backend Servers Outputs
output "backend_servers_info" {
  description = "Information about all backend servers"
  value = {
    for name, server in module.backend_servers : name => {
      instance_id = server.instance_id
      public_ip   = server.public_ip
      private_ip  = server.private_ip
    }
  }
}

