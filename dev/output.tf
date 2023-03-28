output "Bastion_pubip" {
    value = module.Bastion.Bastion_ip 
}

output "docker-prod_prvip" {
  value = module.docker_prod.docker-prodIP
}

output "docker-stage_prvip" {
  value = module.docker_stage.docker-stageIP
}

output "ansible_prvip" {
  value = module.ansible.Ansible_IP
}

output "sonar_pubip" {
  value = module.sonarqube.Sonar_IP
}

output "jenkins-lb_dns" {
  value = module.jenkins.jenkins-lb.dns_name
}

