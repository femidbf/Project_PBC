output "bastion_sg_id" {
    value = aws_security_group.bastion_sg_name.id
}
output "docker-prod_sg_id" {
    value = aws_security_group.docker-prod_sg_name.id
}
output "docker-stage_sg_id" {
    value = aws_security_group.docker-stage_sg_name.id
}

output "ansible_sg_id" {
    value = aws_security_group.ansible_sg_name.id
}

output "jenkins_sg_id" {
    value = aws_security_group.jenkins_sg_name.id
}

output "sonar_sg_id" {
    value = aws_security_group.sonar_sg_name.id
}