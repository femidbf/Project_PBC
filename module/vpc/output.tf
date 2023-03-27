output "vpc_name" {
    value = aws_vpc.vpc_name.id
}
output "PubSN1-id" {
  value = aws_subnet.PubSN1_name.id
}

output "PubSN2-id" {
  value = aws_subnet.PubSN2_name.id
}
output "PrvSN1-id" {
  value = aws_subnet.PrvSN1_name.id
}

output "PrvSN2-id" {
  value = aws_subnet.PrvSN2_name.id
}