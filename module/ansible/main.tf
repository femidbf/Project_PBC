resource "aws_instance" "ansible_name" {
  ami                         = var.ubuntu_ami
  instance_type               = var.insta-type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.ansible-sg]
  subnet_id                   = var.prvsubnet
  associate_public_ip_address = false
  user_data                   = local.ansible_user_data

tags = {
    Name = var.ansible_name
  }
}

