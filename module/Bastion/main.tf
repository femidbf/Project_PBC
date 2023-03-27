# Create Bastion Host
resource "aws_instance" "Bastion_Host" {
  ami                         = var.ubuntu_ami
  instance_type               = var.inst-type
  vpc_security_group_ids      = [var.bastion-sg]
  subnet_id                   = var.pubsubnet
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = <<-EOF
#!/bin/bash
echo "${file(var.path_to_private_key)}" > /home/ubuntu/Prj_PBC
chmod 400 Project_key
sudo hostnamectl set-hostname Bastion
EOF
 
  tags = {
    Name = "Bastion"
  }

  }