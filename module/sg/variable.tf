variable "jenkins_sg_name" {
    default = "Project_PBC_jenkins_sg"
}

variable "vpc_name" {
    default = "dummyy"
}

variable "http_port" {
    default = "80"
}

variable "https_port" {
    default = "443"
}

variable "proxy_port" {
    default = "8080"
}

variable "sonar_port" {
    default = "9000"
}

variable "ssh_port" {
    default = "22"
}

variable "all_access" {
    default = "0.0.0.0/0"
}

variable "docker-stage_sg_name" {
    default = "Project_PBC_docker-stage_sg"
}

variable "docker-prod_sg_name" {
    default = "Project_PBC_docker-prod_sg"
}
variable "sonar_sg_name" {
    default = "Project_PBC_sonar_sg"
}

variable "ansible_sg_name" {
    default = "Project_PBC_ansible_sg"
}

variable "bastion_sg_name" {
    default = "Project_PBC_bastion_sg"
}

variable "mycomputer_ip" {
    default = "129.205.124.230/32"
}

