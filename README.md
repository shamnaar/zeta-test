# Two-tier application with terraform in AWS
A two-tier application having an http webserver and a database(MySQL rds) using terraform built-in modules.

## Architecture
The two-tier architecture includes following components:
- VPC 
- Security Group (webserver security group and rds security group)
- Subnet (Public and Private)
- NAT Gateway
- EC2 instance (for webserver)
- RDS instance (MySQL 5.7)

The VPC includes public subnets and private subnets both in 3 az's, and the private subnet with a NAT Gateway*.

- VPC is in the 10.50.0.0/20 range.
- Private Subnet is in the range of 10.50.1.0/24 to 10.50.3.0/24 for each 3 azs.
- Public Subnet is in the range of 10.50.4.0/24 to 10.50.6.0/24 for each 3 azs.


Note:  The NAT gateway is not necessary for RDS instance even though it is under private subnet.

In this infrasructure, we have two security groups, one for webserver and other for RDS instance.
- The webserver sg has http and ssh ports enabled
- The rds sg has port 3306 enabled

The t3.micro EC2 instance using AL2 as OS
- Pre-installing apache and configuring it using an user-data script

An RDS instance with mysql engine 5.7 