variable "env" {
    type = string
    description = "this variable is for the environment"
    default = "dev"
}

variable "vpc_cidr" {
    type = string
    description = "this variable is for the vpc cidr block"
    default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
  default     = "default"
}

variable "ports" {
    type = list(number)
    description = "these are port numbers for the instance"
    default = [ 22, 443, 80 ]
}

variable "cidr_blocks" {
    type = list(string)
    description = "these are cidr blocks for corresponding ports"
    default = [ "your-ip", "0.0.0.0/0", "0.0.0.0/0" ]
}

variable "main_ami" {
    type = string
    description = "ami id for ec2 instance"
    default = "ami-0c7217cdde317cfec"
}

variable "key_name" {
    type = string
    description = "key name for ec2 instance"
    default = "sedat@windows"
}

variable "instance_type" {
    type = string
    description = "instance type for ec2 instance"
    default = "t2.micro"
}