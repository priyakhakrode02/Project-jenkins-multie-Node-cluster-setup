data "aws_ami" "amazon-linux-server" {

    most_recent = true
    owners = ["137112412989"]

    filter {
      
      name = "name"
      values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240131.0-x86_64-gp2"]

    }
  
}

data "aws_vpcs" "default_vpc" {
  
}