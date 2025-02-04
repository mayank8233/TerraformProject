# File: /home/goofie/terraformVPCProject/vpc_selectionh.tf

/*
   This Terraform file is responsible for prompting the user to select 
   an existing VPC in the Mumbai region or create a new one.
   The options provided:
   1. Use an existing custom VPC (Lists available VPCs).
   2. Use the default AWS VPC.
   3. Create a new VPC.
*/

variable "selected_vpc" {
  description = "Choose an option: 1 - Use an existing custom VPC, 2 - Use the default VPC, 3 - Create a new VPC"
  type        = number
}

data "aws_vpcs" "available_vpcs" {}

output "available_vpcs" {
  description = "List of available VPCs in the Mumbai region"
  value       = data.aws_vpcs.available_vpcs.ids
}

output "vpc_selection_prompt" {
  description = "Instructions for the user to select a VPC option"
  value       = <<EOT
  Please select one of the following options:
  1. Use an existing custom VPC (IDs listed above).
  2. Use the default AWS VPC.
  3. Create a new VPC.
  Enter your choice as a number (1, 2, or 3).
  EOT
}

# Logic to use the selected VPC
resource "aws_vpc" "new_vpc" {
  count = var.selected_vpc == 3 ? 1 : 0

  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "New_Custom_VPC"
  }
}

output "selected_vpc_id" {
  description = "The VPC ID selected or created"
  value       = var.selected_vpc == 1 ? join(", ", data.aws_vpcs.available_vpcs.ids) : (var.selected_vpc == 2 ? "Default VPC" : aws_vpc.new_vpc[0].id)
}
