# Specify the Terraform provider (AWS in this case)
provider "aws" {
  region = "ap-south-1"  # Mumbai Region (Change this if needed)
}

# Call the VPC module
module "vpc" {
  source = "./modules/vpc/"  # Path to the VPC module

  vpc_cidr_block             = var.vpc_cidr_block
  vpc_name                   = var.vpc_name
  public_subnet_cidr         = var.public_subnet_cidr
  public_subnet_az           = var.public_subnet_az
  private_subnet_cidr        = var.private_subnet_cidr
  private_subnet_az          = var.private_subnet_az
}

# (Optional) You can also define other resources here if needed, like EC2, security groups, etc.
