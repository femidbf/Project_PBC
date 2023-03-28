module "vpc" {
    source = "../module/vpc"
}

module "sg" {
    source = "../module/sg"
    vpc_name = module.vpc.vpc_name

}

module "keypair" {
    source = "../module/keypair"
        
}

module "Bastion" {
  source = "../module/Bastion"
  ubuntu_ami = var.ami-u
  bastion-sg = module.sg.bastion_sg_id
  pubsubnet  = module.vpc.PubSN1-id 
  key_name   = module.keypair.keypair_id
 
}

module "ansible" {
  source = "../module/ansible"
  ubuntu_ami = var.ami-u
  ansible-sg = module.sg.ansible_sg_id
  prvsubnet  = module.vpc.PrvSN1-id 
  key_name   = module.keypair.keypair_id
  docker-stageIP = module.docker_stage.docker-stageIP
  docker-prodIP = module.docker_prod.docker-prodIP
#   docker_image = "../module/ansible/docker_image.yml"
#   docker_stage = "../module/ansible/docker_stage.yml"
#   docker_prod = "../module/ansible/docker_prod.yml"
#   Dockerfile = "../module/ansile/Dockerfile"
}

module "docker_prod" {
  source = "../module/docker-prod"
  redhat_ami = var.ami-r
  docker-prod-sg = module.sg.docker-prod_sg_id
  prvsubnet  = module.vpc.PrvSN2-id
  key_name   = module.keypair.keypair_id
  
}

module "docker_stage" {
  source = "../module/docker-stage"
  redhat_ami = var.ami-r
  docker-stage-sg = module.sg.docker-stage_sg_id
  prvsubnet  = module.vpc.PrvSN1-id
  key_name   = module.keypair.keypair_id
  
}

module "sonarqube" {
  source = "../module/sonarqube"
  ubuntu_ami = var.ami-u
  sonar-sg = module.sg.sonar_sg_id
  pubsubnet  = module.vpc.PubSN2-id 
  key_name   = module.keypair.keypair_id
 
}

module "jenkins" {
  source = "../module/jenkins"
  redhat_ami = var.ami-r
  jenkins-sg = module.sg.jenkins_sg_id
  prvsubnet  = module.vpc.PrvSN2-id
  key_name   = module.keypair.keypair_id
  
}

module "jenkins_lb" {
  source = "../module/jenkins_lb"
  pubsubnet = module.vpc.PubSN2-id
  securitygroup_id = module.jenkins_lb.jenkins-lb-sg-id
  instance_id = module.jenkins.jenkins_ID
  vpc_name = module.vpc.vpc_name

}


