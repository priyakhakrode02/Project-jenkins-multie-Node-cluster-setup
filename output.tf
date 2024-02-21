output "OutputOfAMI" {

    value = data.aws_ami.amazon-linux-server
  
}

output "output of VPC-ID" {

       value = data.aws_vpcs.default_vpc.ids   
}