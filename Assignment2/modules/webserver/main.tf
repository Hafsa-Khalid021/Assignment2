resource "aws_instance" "nginx" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [var.nginx_sg_id]

  user_data = file("${path.module}/../../scripts/nginx-setup.sh")

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-nginx"
    }
  )
}

resource "aws_instance" "web" {
  count                  = 1
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [var.web_sg_id]

  user_data = file("${path.module}/../../scripts/apache-setup.sh")

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-web-${count.index + 1}"
    }
  )
}
