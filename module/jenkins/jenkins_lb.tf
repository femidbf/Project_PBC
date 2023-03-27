# Create Jenkins Classic Load Balancer
resource "aws_elb" "jenkins-lb" {
  name            = "jenkins-lb"
  subnets         = [aws_subnet.PubSN2_name.id]
  security_groups = [aws_security_group.jenkins_sg_name.id]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8080"
    interval            = 30
  }

  instances                   = [aws_instance.jenkins_name.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "jenkins-lb"
  }
}# Create Jenkins Load balancer Security Group
resource "aws_security_group" "jenkins_lb_sg" {
  name        = var.jenkins_sg_name
  description = "Allow Jenkins traffic"
  vpc_id      = var.vpc_name

  
  ingress {
    description = "Proxy Traffic"
    from_port   = var.proxy_port
    to_port     = var.proxy_port
    protocol    = "tcp"
    cidr_blocks = [var.all_access]
  }

  ingress {
    description = "http"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    security_groups = [aws_security_group.jenkins_sg_name.id]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_access]
  }
  tags = {
    Name = "jenkins_lb_sg"
  }
}


