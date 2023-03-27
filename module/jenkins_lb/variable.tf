variable "jenkins-lb-name" {
    default = "jenkins-lb"
}
variable "subnet_id" {
    default     = "dummy"
}
variable "securitygroup_id" {
   default="dummy"
}
variable "lb_instance_port" {
    default = 8080
}
variable "instance-lb_protocol" {
   default = "http"
}
variable "lb_port" {
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

