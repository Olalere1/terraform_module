
# Configure aws provider
provider "aws" {
  region  = var.region
  profile = "cbauser_admin"       # Use your AWS profile I suppose! as in the Backend.tf also
}

# Calling the VPC - with region, cidr and all subnets
module "vpc" {
    source          = "../modules/vpc"
    region          = var.region
    vpc_cidr_block  = var.vpc_cidr_block
    public_subnets  = var.public_subnets
    private_subnets = var.private_subnets 
}