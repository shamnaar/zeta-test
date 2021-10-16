module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"
  depends_on = [
      module.vpc,
      module.mysql_security_group
  ]

  identifier = "rdstest"

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.large"
  allocated_storage = 5

  name     = "rdstest"
  username = "admin"
  password = "admin1234"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.mysql_security_group.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Name = "rdstest"
  }

  # DB subnet group
  subnet_ids = module.vpc.private_subnets

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

}