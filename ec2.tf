module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  depends_on = [
      module.vpc,
      module.security_group
  ]

  name = local.name

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.ssh_access_key
  monitoring             = true
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[1]

  user_data_base64 = base64encode(local.user_data)

  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}