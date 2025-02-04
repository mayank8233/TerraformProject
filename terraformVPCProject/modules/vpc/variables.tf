# Define VPC CIDR Block
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

# Define VPC Name
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# Define Public Subnet CIDR Block
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

# Define Public Subnet Availability Zone
variable "public_subnet_az" {
  description = "Availability Zone for the public subnet"
  type        = string
}

# Define Private Subnet CIDR Block
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

# Define Private Subnet Availability Zone
variable "private_subnet_az" {
  description = "Availability Zone for the private subnet"
  type        = string
}
