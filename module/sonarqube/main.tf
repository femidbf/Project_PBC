resource "aws_instance" "sonar_name" {
  ami                         = var.ubuntu_ami
  instance_type               = var.insta-type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.sonar-sg]
  subnet_id                   = var.pubsubnet
  associate_public_ip_address = true
  user_data                   = local.sonar_user_data

tags = {
    Name = var.sonar_name
  }
}