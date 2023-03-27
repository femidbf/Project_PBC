# Create Ansible Security Group
resource "aws_security_group" "ansible_sg_name" {
  name        = var.ansible_sg_name
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_name


  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg_name.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_access]
  }

  tags = {
    Name = var.ansible_sg_name
  }
}

# Create Jenkins Security Group
resource "aws_security_group" "jenkins_sg_name" {
  name        = var.jenkins_sg_name
  description = "Allow Jenkins traffic"
  vpc_id      = var.vpc_name

  
  ingress {
    description = "Proxy"
    from_port   = var.proxy_port
    to_port     = var.proxy_port
    protocol    = "tcp"
    cidr_blocks = [var.all_access]
  }

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg_name.id]
  }

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.ansible_sg_name.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_access]
  }
  tags = {
    Name = var.jenkins_sg_name
  }
}

# Create docker-stage security group
resource "aws_security_group" "docker-stage_sg_name" {
  name        = var.docker-stage_sg_name
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_name

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.all_access]
  }

  ingress {
    description = "APPLICATION"
    from_port   = var.proxy_port
    to_port     = var.proxy_port
    protocol    = "tcp"
    cidr_blocks = [var.all_access]
  }

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg_name.id]
  }

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.ansible_sg_name.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_access]
  }

  tags = {
    Name = var.docker-stage_sg_name
  }
}

# Create docker-prod security group
resource "aws_security_group" "docker-prod_sg_name" {
  name        = var.docker-prod_sg_name
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_name

  ingress {
    description = "HTTPS"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.all_access]
  }

  ingress {
    description = "APPLICATION"
    from_port   = var.proxy_port
    to_port     = var.proxy_port
    protocol    = "tcp"
    cidr_blocks = [var.all_access]
  }

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg_name.id]
  }

   ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    security_groups = [aws_security_group.ansible_sg_name.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_access]
  }

  tags = {
    Name = var.docker-prod_sg_name
  }
}
# Create Sonarqube Security Group
resource "aws_security_group" "sonar_sg_name" {
  name        = var.sonar_sg_name
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_name

  ingress {
    description = "sonarqube"
    from_port   = var.sonar_port
    to_port     = var.sonar_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    security_groups = [aws_security_group.jenkins_sg_name.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sonar_sg_name
  }
}

# Create Bastion Security Group
resource "aws_security_group" "bastion_sg_name" {
  name        = var.bastion_sg_name
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_name


  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.mycomputer_ip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_access]
  }

  tags = {
    Name = var.bastion_sg_name
  }
}
