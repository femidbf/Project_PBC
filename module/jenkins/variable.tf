variable "jenkins_name" {
    default = "Project_PBC_Jenkins"
}
variable "redhat_ami" {
    default = "dummy"
}
variable "insta-type" {
    default = "t2.medium"
}

variable "prvsubnet" {
    default = "dummy"
}

variable "key_name" {
    default = "dummy"
}

variable "jenkins-sg" {
    default = "dummy"
}
variable "path_to_private_key" {
  default = "~/keypairs/Prj_PBC"
}

variable "all_access" {
    default = "0.0.0.0/0"
}