# ===== Application Load Balancer Variables =====

variable "lb_name" {
    type = string
    description = "load balancer name for web app"
    default = "web-app-alb"
}

variable "internal_feature" {
  type    = bool
  default = false
}

variable "lb_type" {
    type = string
    description = "load balancer type for web app"
    default = "application"
}

variable "default_feature" {
  type    = bool
  default = true
}

variable "env" {
    type = string
    description = "this variable is for the environment"
    default = "dev"
}

# ===== Security Group Variables =====

variable "lb_sg_name" {
    type = string
    description = "security group name for web app"
    default = "web-app-sg"
}

variable "lb_sg_description" {
    type = string
    description = "description for sg"
    default = "Allow ports and protocols for web instance"
}

variable "ports" {
    type = list(number)
    description = "these are port numbers for the instance"
    default = [ 443, 80 ]
}

variable "cidr_blocks" {
    type = list(string)
    description = "these are cidr blocks for corresponding ports"
    default = [ "0.0.0.0/0", "0.0.0.0/0" ]
}

variable "cidr_ipv4" {
    type = string
    description = "these are cidr blocks for corresponding ports"
    default = "0.0.0.0/0" 
}

variable "egress_ip_protocol" {
    type = string
    description = "protocol for the egress ports"
    default = "-1"
}

