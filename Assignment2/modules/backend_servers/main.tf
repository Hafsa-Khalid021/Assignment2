resource "aws_instance" "backend" {
  ami                    = "ami-0c02fb55956c7d316"  # replace with your region's Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  key_name               = var.key_pair_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.web_sg_id]

  tags = {
    Name = "backend-server"
  }
}
