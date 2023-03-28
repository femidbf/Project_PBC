# terraform {
  
#   backend "s3" {
    
#     bucket = "femi_state_buck"
#     key    = "project/stage/compute/terraform.tfstate"
#     region = "eu-west-2"
#     dynamodb_table = "femippbc_dynamodb_table"
    
#   }
# }