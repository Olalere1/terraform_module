# terraform_module
Creating a Terraform module to build a 3-tier VPC architecture

# Project Overview:
This project entails the creation of a Terraform module for a 3tier VPC architecture,enabling efficient and scalable deployment of networking resources on AWS.The module include the creation of a VPC,subnets,routetables,and essential outputs to facilitate modular and reusable infrastructure provisioning.

# Project Steps:

1. Creating a VPC and Subnets:- Using AWS syntax to define a VPC,including ciderblock,internetgateway,and a public subnet.
  -Specify availability zones and tags for each subnet to ensure proper segmentation.

2. Creating Subnets and RouteTables in AWS:- Introduce a variable for ciderblock and modify it to create a private app subnet.
-Leverage variables and create route tables to associate subnets accordingly.

3. Creating Private Subnets in Different Availability Zones:- Utilize 'var' to reference variable names for VPC ID and cider block.
   -Set 'map public ip on launch' to false for private subnets to enhance security.

4. Creating Outputs to Export Values from VPC Module:- Implement outputs to export essential values for referencing in other resources.
   -Define outputs for region,VPCID, and subnetIDs.

5. Create Outputs and Reference Module in New Project Folder:- Extend outputs to cover private data subnet and internet gateway. Reference the vpc module in a new project folder and create a backend.tffile.

6. Creating AWS Backend and Provider Authentication:- Formulate a backend file in S3 to store Terraformstate securely. Configure the provider to authenticate with the AWS environment for seamless integration.

7. Create a Terraform.tfvars File to Enter Values for Variables:- List all variables in the variablesfile. Arrange equal signs under each other for clear and organized formatting. Reference the VPC module by specifying the source and entering values for arguments using var.name.

8. Create VPC in AWS Environment Using Terraform:- List variable names from variables.tf in terraform.tfvars. Enter actual values for each variable and save the file. Initialize the AWS environment using 'terraform init' and create the VPC using 'terraformapply'.


<img width="1440" alt="Terraform_module_3tier_VPC_CADD_Project1" src="https://github.com/user-attachments/assets/f64c395e-43f9-4d8c-bb3e-d7ace37ffd14">



