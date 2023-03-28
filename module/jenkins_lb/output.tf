output "jenkins-lb-sg-id" {
  value = aws_security_group.jenkins-lb_sg_name.id
}

output "jenkins_lb_dns_name" {
  value = aws_elb.jenkins-lb.dns_name
}

