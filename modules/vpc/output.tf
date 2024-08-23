# Creating output with names from variable and output value using the "var."
# Define outputs for region,projectname,VPCID, subnetIDs, private data subnet and internet gateway.

output "region" {
    value = var.region
}

output "vpc_cidr" {
    value = var.vpc_cidr_block
}

output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "subnet_cidr" {
    value = var.subnet_cidr_blocks
}

output "public_subnet1" {
    #value = aws_subnet.public_subnets[each.value.name]
     value = { for name, subnet in aws_subnet.public_subnets : name => subnet.id }
}

output "public_subnet2" {
     #value = aws_subnet.public_subnets.id[each.key]
     value = { for name, subnet in aws_subnet.public_subnets : name => subnet.id }
}


output "private_app_subnet1" {
    #value = aws_subnet.private_subnets[each.key]
    value = { for name, subnet in aws_subnet.public_subnets : name => subnet.id }
}

output "private_app_subnet2" {
    #value = aws_subnet.private_subnets[each.key]
    value = { for name, subnet in aws_subnet.public_subnets : name => subnet.id }
}

output "private_data_subnet1" {
    #value = aws_subnet.private_subnets[each.key]
    value = { for name, subnet in aws_subnet.public_subnets : name => subnet.id }
}

output "private_data_subnet2" {
    #value = aws_subnet.private_subnets[each.key]
    value = { for name, subnet in aws_subnet.public_subnets : name => subnet.id }
}

output "internet_gateway" {
    value = aws_internet_gateway.my_igw
}

