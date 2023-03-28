output "jenkins_IP" {
    value = aws_instance.jenkins_name.private_ip
}

output "jenkins_ID" {
    value = aws_instance.jenkins_name.id
  
}
