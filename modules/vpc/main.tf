
# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "my_vpc"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}


# Define the subnets configuration
locals {
  subnets = {
    public_subnet_1 = {
      cidr_block        = var.subnet_cidr_blocks[0]
      availability_zone = "eu-west-1a"
      name             = "public_subnet_1"
    }
    public_subnet_2 = {
      cidr_block        = var.subnet_cidr_blocks[1]
      availability_zone = "eu-west-1b"
      name             = "public_subnet_2"
    }
  }
}


# Create the PUBLIC subnets using a single resource block with for_each
resource "aws_subnet" "public_subnets" {
  #for_each               = toset(var.public_subnets)
  for_each                = local.subnets

  vpc_id                  = aws_vpc.my_vpc.id  # Replace with your VPC ID
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = each.value.name
  }
}



# Create a route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my_route_table"
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "my_route_table_association" {
  for_each       = aws_subnet.public_subnets    #{for subnet in var.public_subnets : Name => }
  subnet_id      = each.value.id                 #["aws_subnet.public_subnet_1.id", "aws_subnet.public_subnet_2.id"]
  route_table_id = aws_route_table.my_route_table.id
}



# Define the PRIVATE subnets configuration
locals {
  pri_subnets = {
    private_app_subnet_1 = {
      cidr_block        = var.subnet_cidr_blocks[2]
      availability_zone = "eu-west-1a"
      name             = "private_app_subnet_1"
    }
    private_app_subnet_2 = {
      cidr_block        = var.subnet_cidr_blocks[3]
      availability_zone = "eu-west-1b"
      name             = "private_app_subnet_2"
    }
    private_data_subnet_1 = {
      cidr_block        = var.subnet_cidr_blocks[4]
      availability_zone = "eu-west-1a"
      name             = "private_data_subnet_1"
    }
    private_data_subnet_2 = {
      cidr_block        = var.subnet_cidr_blocks[5]
      availability_zone = "eu-west-1b"
      name             = "private_data_subnet_2"
    }
  }
}


# Create the PRIVATE subnets using a single resource block with for_each
resource "aws_subnet" "private_subnets" {
  #for_each               = toset(var.private_subnets)
  for_each                = local.pri_subnets

  vpc_id                  = aws_vpc.my_vpc.id  # Replace with your VPC ID
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = each.value.name
  }
}

# START FROM BULLET 5