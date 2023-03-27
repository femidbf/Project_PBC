resource "aws_key_pair" "Prj_key" {
  key_name   = var.key_name
  public_key = file(var.path_to_public_key)
}