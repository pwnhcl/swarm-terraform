module "key-pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.1.1"

  key_name   = "terraform-key"
  public_key = file("id_rsa.pub")

}
