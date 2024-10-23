provider "aws" {
  # Region to create infrastructure
  region = var.region_title
}

# Define the AWS instance and attach the existing Security Group and Key Pair
resource "aws_instance" "app_instance" {
  # Specify the AMI ID ami-0c1c30571d2dae5c9 (for Ubuntu 22.04 LTS)
  ami = var.app_ami_id

  # Specify the instance type - t2.micro
  instance_type = var.app_instance_type

  # Add a Public IP address to this instance
  associate_public_ip_address = true

  # Attach the existing security group using the ID
  vpc_security_group_ids = [var.nsg_allow_port_22_3000_80]  # Replace with your actual security group ID

  # Attach the key pair to enable SSH access
  key_name = var.aws_key_name

  # Tag the instance with a name
  tags = {
    Name = var.ec2_instance_name
  }
}