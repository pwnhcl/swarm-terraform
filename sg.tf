module "sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name   = "custom-sg"
vpc_id = module.vpc.vpc_id

ingress_with_cidr_blocks = concat(
  [for port in var.app_ports : {
    from_port   = port
    to_port     = port
    protocol    = "tcp"
    description = "Allow Port ${port}"
    cidr_blocks = "0.0.0.0/0"
  }],
  [{
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = "0.0.0.0/0"
  }]
)

egress_rules = ["all-all"]
}