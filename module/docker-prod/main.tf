resource "aws_instance" "docker-prod_name" {
  ami                         = var.redhat_ami
  instance_type               = var.insta-type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.docker-prod-sg]
  subnet_id                   = var.prvsubnet
  associate_public_ip_address = false
  user_data                   = local.docker-prod_user_data

tags = {
    Name = var.docker-prod_name
  }
}