variable "jenkins-lb-name" {
    default = "jenkins-lb"
}
variable "pubsubnet" {
    default     = "dummy"
}
variable "securitygroup_id" {
   default="dummy"
}
variable "proxy_port" {
    default = 8080
}
variable "instance-lb_protocol" {
   default = "http"
}
variable "http_port" {
    default = 80
}
variable "healthy_threshold" {
    default = 2
}
variable "unhealthy_threshold" {
    default = 2
}
variable "timeout" {
    default = 3
}
variable "interval" {
    default = 30
}
variable "idle_timeout" {
    default = 400
}
variable "connection_draining_timeout" {
    default = 400
}
variable "instance_id" {
    default = "dummy"
}

variable "jenkins-lb_sg_name" {
    default = "Project_PBC_jenkins-lb-sg" 
}

variable "vpc_name" {
    default = "dummyy"
}

variable "all_access" {
    default = "0.0.0.0/0"
}