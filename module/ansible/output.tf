output "Ansible_IP" {
    value = aws_instance.ansible_name.private_ip
}

data "aws_secretsmanager_secret_version" "access" {
  secret_id = "phemy"
}

locals {
    ubuntu_cred = jsondecode(data.aws_secretsmanager_secret_version.access.secret_string)
}