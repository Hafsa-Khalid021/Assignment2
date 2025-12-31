
resource "aws_instance" "nginx" {
  ami                    = "ami-05524d6658fcf35b6"  # replace with your region's Amazon Linux 2 AMI
  instance_type          = "t3.micro"
  key_name               = var.key_pair_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.nginx_sg_id]

  tags = {
    Name = "nginx-server"
  }
}
