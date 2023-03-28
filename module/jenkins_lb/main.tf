# Create Jenkins Load Balancer
resource "aws_elb" "jenkins-lb" {
  name            = var.jenkins-lb-name
  subnets         = [var.pubsubnet]
  security_groups = [var.securitygroup_id]

  listener {
    instance_port     = var.proxy_port
    instance_protocol = var.instance-lb_protocol
    lb_port           = var.http_port
    lb_protocol       = var.instance-lb_protocol
  }

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    target              = "TCP:8080"
    interval            = var.interval
  }

  instances                   = [var.instance_id]
  cross_zone_load_balancing   = true
  idle_timeout                = var.idle_timeout
  connection_draining         = true
  connection_draining_timeout = var.connection_draining_timeout

  tags = {
    Name = var.jenkins-lb-name
  }
}

# Create Jenkins Load Balancer Security Group
resource "aws_security_group" "jenkins-lb_sg_name" {
  name        = var.jenkins-lb_sg_name
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
    description = "Allow Proxy Access"
    from_port   = var.proxy_port
    to_port     = var.proxy_port
    protocol    = "tcp"
    cidr_blocks = [var.all_access]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_access]
  }

  tags = {
    Name = var.jenkins-lb_sg_name
  }
}
