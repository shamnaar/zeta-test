module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

    depends_on = [
      module.vpc
  ]

  name        = local.name
  description = "Security group for EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = local.tags
}
