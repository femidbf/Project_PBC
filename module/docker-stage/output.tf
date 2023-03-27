output "docker-stageIP" {
    value = aws_instance.docker-stage_name.private_ip
}
