output "nginx_sg_id" {
  value = aws_security_group.nginx_sg.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}
