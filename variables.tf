########################
### Global variables ###
########################

variable "profile" {
  default     = "aws_own"
  description = "Use if you have a profile."
}

variable "region" {
  default     = "us-east-1"
  description = "Set up region"
}

variable "tags" {
  type = map(any)
  default = {
    Owner       = "Alex"
    Project     = "Games"
    Name        = "CS1.6_server"
    Size        = "small"
  }
  description = "Use this map of tags. Use to generate bucket name, names or resources, tags. See global_name in module"
}

##########################
### Instance variables ###
##########################

variable "instance_type" {
  type = map(any)
  default = {
    small  = "t2.micro"
    medium = "t2.small"
    big    = "t2.2xlarge"
  }
  description = "Use this map of the instance type. Use to make our env more flexible"
}

variable "ami_image" {
  type = object({
    ami_owners       = list(string)
    ami_filter_value = list(string)
    ami_filter_name  = string
  })
  default = {
    ami_owners       = ["amazon"]
    ami_filter_value = ["amzn2-ami-hvm-*-x86_64-gp2"]
    ami_filter_name  = "name"
  }
  description = "Add owner and ami_name to search and choose most recent ami"
}

#########################
###   VPC variables   ###
#########################

variable "sec_group" {
  type = object({
    port_tcp = list(string)
    port_udp = list(string)
    external = string
    internal = string
  })
  default = {
    port_tcp = ["27015", "22"]
    port_udp = ["27015"]
    external = "0.0.0.0/0"
    internal = "10.1.1.0/30"
  }
  description = "Ports, subnets for Security group."
}

