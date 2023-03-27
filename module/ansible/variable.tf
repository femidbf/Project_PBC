variable "ansible_name" {
    default = "Project_PBC_Ansible"
}
variable "ubuntu_ami" {
    default = "dummy"
}
variable "insta-type" {
    default = "t2.micro"
}

variable "prvsubnet" {
    default = "dummy"
}

variable "key_name" {
    default = "dummy"
}

variable "ansible-sg" {
    default = "dummy"
}

variable "Dockerfile" {
    default = "~/Desktop/DevOps_MotivaLogic/Personal_Projects/Project_PBC/module/ansible/Dockerfile"
}

variable "docker_image" {
    default = "~/Desktop/DevOps_MotivaLogic/Personal_Projects/Project_PBC/module/ansible/docker_image.yml"
}

variable "docker_prod" {
    default = "~/Desktop/DevOps_MotivaLogic/Personal_Projects/Project_PBC/module/ansible/docker_prod.yml"
}

variable "docker_stage" {
    default = "~/Desktop/DevOps_MotivaLogic/Personal_Projects/Project_PBC/module/ansible/docker_stage.yml"
}

variable "path_to_private_key" {
  default = "~/keypairs/Prj_PBC"
}

variable "docker-stageIP" {
    default = "dummy"
}

variable "docker-prodIP" {
    default = "dummy"
}