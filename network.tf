provider "aws" {
  region = "ap-south-1"
}

data "aws_availability_zones" "name" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "website-vpc"
  cidr = "172.16.0.0/16"
    
#   azs             = data.aws_availability_zones.name.names
  azs = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["172.16.10.0/24", "172.16.20.0/24", "172.16.30.0/24"]
  private_subnets = ["172.16.40.0/24", "172.16.50.0/24", "172.16.60.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}