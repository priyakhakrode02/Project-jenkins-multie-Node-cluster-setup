variable "instanceTagname" {

    type = string
    default = "jenkins-master"
  
}

variable "InstanceType" {

    type = string
    default = "t2.micro"

  
}

variable "ami-id" {

    default = "ami-0cf10cdf9fcd62d37"
  
}

variable "SecurityGroup" {

    default = "jenkins-master-SG"
  
}
