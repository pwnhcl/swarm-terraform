terraform {
  backend "s3" {
    bucket         = "pwnhcl-module"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    # dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}