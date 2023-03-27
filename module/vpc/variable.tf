variable "vpc_name" {
    default =  "Project_PBC_VPC"
}
variable "vpc_cidr_block" {
    default =  "10.0.0.0/16"
}

variable "all_access" {
    default = "0.0.0.0/0"
}
variable "PubSN1_name" {
    default =  "Project_PBC_PubSN1"
}

variable "PubSN1_cidr_block" {
    default =  "10.0.1.0/24"
}

variable "PubSN1_az1" {
    default = "eu-west-2a"
}

variable "PubSN2_name" {
    default =  "Project_PBC_PubSN2"
}

variable "PubSN2_cidr_block" {
    default =  "10.0.2.0/24"
}

variable "PubSN2_az2" {
    default = "eu-west-2b"
}

variable "PrvSN1_name" {
    default =  "Project_PBC_PrvSN1"
}

variable "PrvSN1_cidr_block" {
    default =  "10.0.3.0/24"
}

variable "PrvSN1_az1" {
    default = "eu-west-2a"
}

variable "PrvSN2_name" {
    default =  "Project_PBC_PrvSN2"
}

variable "PrvSN2_cidr_block" {
    default =  "10.0.4.0/24"
}

variable "PrvSN2_az2" {
    default = "eu-west-2b"
}

variable "IGW_name" {
    default = "Project_PBC_IGW"
}

variable "EIP_name" {
    default = "Project_PBC_EIP"
}

variable "NGW_name" {
    default = "Project_PBC_NGW"
}

variable "Pub_RTB_name" {
    default = "Project_PBC_Pub_RTB"     
}

variable "Prv_RTB_name" {
    default = "Project_PBC_Prv_RTB"     
}
variable "all_IP" {
    default = "0.0.0.0/0"  
}

variable "Pub_RTB_AS1_name" {
    default = "Project_PBC_Pub_RTB_AS1"
}

variable "Pub_RTB_AS2_name" {
    default = "Project_PBC_Pub_RTB_AS2"
}

variable "Prv_RTB_AS1_name" {
    default = "Project_PBC_Prv_RTB_AS1"
}

variable "Prv_RTB_AS2_name" {
    default = "Project_PBC_Prv_RTB_AS2"
}