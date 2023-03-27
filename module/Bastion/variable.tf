variable "Bastion_Host" {
    default = "Project_PBC_Bastion"
}

variable "ubuntu_ami" {
    default = "dummy"
}
variable "inst-type" {
    default = "t2.medium"
}

variable "pubsubnet" {
    default = "dummy"
}

variable "key_name" {
    default = "dummy"
  
}

variable "bastion-sg" {
    default = "dummy"
}

variable "path_to_private_key" {
  default = "~/keypairs/Prj_PBC"
}