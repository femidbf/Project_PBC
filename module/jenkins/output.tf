output "jenkins_IP" {
    value = aws_instance.jenkins_name.private_ip
}

output "jenkins_lb_dns_name" {
  value = "dummy"
}