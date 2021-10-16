
provider "aws" {
  profile = "default"
  region  = var.region
}

locals {
  name   = "ec2-test"

  user_data = <<-EOT
  #!/bin/bash
  yum update -y
  yum install httpd -y
  service httpd start
  chkconfig httpd on
  echo "Hello World!" > /var/www/html/index.html
  yum install mysql -y
  EOT

  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}


#terraform {
#  backend "s3" {
#   bucket         = "tf-tfstate-test"
#   key            = "eu-west-2/terraform-zeta-test/terraform.tfstate"
#   region         = "eu-west-2"
#
#   dynamodb_table = "terraform-state-lock"
#    encrypt        = true
#  }
#}
