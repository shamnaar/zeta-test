#======================================
### Global Variables ###
#=====================================

variable "region" {
  default = "eu-west-2"
}

variable "env" {
  default = "dev"
}

variable "app" {
  default = "dev-test"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ssh_access_key" {
  default = "fortest"
}

variable "ami_id" {
  default = "ami-02f5781cba46a5e8a"
}

#=======================================
### VPC Variables ###
#=======================================

variable "vpc_cidr" {
  description = "Organization level VPC which have IP range from 10.10.0.0 to 10.10.15.251"
  default = "10.50.0.0/20"
}

variable "vpc_private_subnets" {
  description = "Private subnets that have NAT gateway attached in all three az's"
  type        = list(string)
  default = ["10.50.1.0/24", "10.50.2.0/24", "10.50.3.0/24"]
}

variable "vpc_public_subnets" {
  description = "Private subnets for Internet access, available in all three az's"
  type        = list(string)
  default = ["10.50.4.0/24", "10.50.5.0/24", "10.50.6.0/24"]
}

### "vpc_enable_nat_gateway" = "true" means it will create nat gateway in all three AZ's on the private subnets, ###
### so adding vpc_single_nat_gateway=true will cut short it to single nat gateway ### 
variable "vpc_enable_nat_gateway" {
  default = true
}

variable "vpc_single_nat_gateway" {
  default = true
}

variable "vpc_azs" {
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}
