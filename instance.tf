module "ec2_instances_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.3.0"

  for_each = {
    for index, subnet in module.vpc.public_subnets :
    "server${index + 1}" => subnet
  }

  name           = each.key
  ami            = var.ami
  instance_type  = "t2.micro"
  key_name       = "terraform-key"
  monitoring     = true

  subnet_id              = each.value
  vpc_security_group_ids = [module.sg.security_group_id]

  associate_public_ip_address = true

  tags = {
    Name        = each.key
    Environment = "public"
  }
}

module "ec2_instances_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.3.0"

  for_each = {
    for index, subnet in module.vpc.private_subnets :
    "server${index + 1}" => subnet
  }

  name           = each.key
  ami = var.ami
  instance_type  = "t2.micro"
  key_name       = "terraform-key"
  monitoring     = true

  subnet_id              = each.value
  vpc_security_group_ids = [module.sg.security_group_id]

  associate_public_ip_address = false

  tags = {
    Name        = each.key
    Environment = "private"
  }
}

