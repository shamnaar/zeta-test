module "mysql_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/mysql"
  version = "~> 4.0"
  
  depends_on = [
      module.vpc
  ]

  name        = "rds_sg"
  description = "Security group for rds instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [var.vpc_cidr]
  ingress_rules       = ["mysql-tcp"]
  egress_rules        = ["all-all"]

  tags = {
    Name = "rds_sg"
  }
}