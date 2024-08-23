# Region of deployment
variable "region" {
  description = "region of deployment"
  type        = string
  default     = "eu-west-1"
}


# Single CIDR block
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Optional default value
}

# Multiple CIDR blocks (for subnets)
variable "subnet_cidr_blocks" {
  description = "A list of CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]  # Optional default values
}


# Variable definition for public subnets
variable "public_subnets" {
  description = "List of public subnets with CIDR block, availability zone, and name tag"
  type = list(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
  default = [
    {
      cidr_block        = "var.subnet_cidr_blocks[0]"                       # "10.0.1.0/24"
      availability_zone = "eu-west-1a"
      name              = "public_subnet_1"
    },
    {
      cidr_block        = "var.subnet_cidr_blocks[1]"                       # "10.0.2.0/24"
      availability_zone = "eu-west-1b"
      name              = "public_subnet_2"
    }
  ]
}


# Variable definition for PRIVATE subnets
variable "private_subnets" {
  description = "List of PRIVATE subnets with CIDR block, availability zone, and name tag"
  type = list(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
  default = [ 
    {
      cidr_block        = "var.subnet_cidr_blocks[2]"                       # "10.0.3.0/24"
      availability_zone = "eu-west-1a"
      name              = "private_subnet_1"
    },
    {
      cidr_block        = "var.subnet_cidr_blocks[3]"                       # "10.0.4.0/24"
      availability_zone = "eu-west-1b"
      name              = "private_subnet_2"
    },
    {
      cidr_block        = "var.subnet_cidr_blocks[4]"                       # "10.0.3.0/24"
      availability_zone = "eu-west-1a"
      name              = "private_data_subnet_3"
    },
    {
      cidr_block        = "var.subnet_cidr_blocks[5]"                       # "10.0.4.0/24"
      availability_zone = "eu-west-1b"
      name              = "private_data_subnet_4"
    }
  ]
}


