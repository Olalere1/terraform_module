# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "reddit-olalere-bucket"
    key       = "jupiter-terraform.tfstate"
    region    = "eu-west-1"
    profile   = "cbauser_admin"
  }
}