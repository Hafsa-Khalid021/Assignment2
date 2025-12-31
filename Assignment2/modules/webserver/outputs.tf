output "nginx_public_ip" {
  value = aws_instance.nginx.public_ip
}

output "web_private_ips" {
  value = aws_instance.web[*].private_ip
}

output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "private_ip" {
  value = aws_instance.this.private_ip
}
