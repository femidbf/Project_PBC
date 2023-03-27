output "docker-prodIP" {
    value = aws_instance.docker-prod_name.private_ip
}
