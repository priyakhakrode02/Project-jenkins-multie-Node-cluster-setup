terraform {

     required_providers {
           aws = {

              source = "hashicorp/aws"
              version = "~>5.31"
           }
     }

}

provider "aws" {

    region = "us-east-1"

}

resource "aws_instance" "jenkins-instance" {

    ami = data.aws_ami.amazon-linux-server.id
    instance_type = var.InstanceType 
    tags = {

        Name = var.instanceTagname
    }

    key_name = aws_key_pair.jen-key-pair.key_name
    vpc_security_group_ids = [aws_security_group.jen-security-group.id]
  
}


resource "aws_key_pair" "jen-key-pair" {

    key_name = "jenkins-master-key"
    public_key = "hbgyfuftuytfgyghb hvahasosaoiodfuhvufuvhjhvb jncb hvJJKLKLknx bcn bdhgdyhgdyuruyuyi"

  
}

resource "aws_security_group" "jen-security-group" {


    name = var.SecurityGroup
    description = "terraform generated security Group for jenkins master"
    vpc_id = data.aws_vpcs.default_vpc.ids[0]

    ingress {

        description   = "SSH"
        from_port     =  22
        to_port       =  22
        protocol      =  "tcp"
        cidr_blocks   = ["0.0.0.0/0"]

    }

    ingress {

        description  = "HTTP"
        from_port    = 80
        to_port      = 80
        protocol     = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]

    }

    ingress {

        description   = "jenkins"
        from_port     = 8080
        to_port       = 8080
        protocol      = "tcp"
        cidr_blocks   = ["0.0.0.0/0"] 

    }

    egress {

        from_port     = 0
        to_port       = 0
        protocol      = "-1"
        cidr_blocks   = ["0.0.0.0/0"] 




    }
  
}