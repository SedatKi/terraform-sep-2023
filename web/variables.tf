# Each variable is listed under the resource it belongs to

# ======== Application Load Balancer(ALB) Variables ========

variable "internal_feature" {
  type    = bool
  default = false
}

variable "lb_type" {
  type        = string
  description = "load balancer type for web app"
  default     = "application"
}

variable "default_feature" {
  type    = bool
  default = true
}

variable "listener_port" {
  type        = list(string)
  description = "port number for listener"
  default     = ["80", "443"]
}

variable "listener_protocol" {
  type        = list(string)
  description = "protocol type for listener"
  default     = ["HTTP", "HTTPS"]
}

variable "routing_action" {
  type        = string
  description = "type of routing action"
  default     = "forward"
}
# ======== ALB Security Group Variables =========

variable "lb_sg_description" {
  type        = string
  description = "description for sg"
  default     = "Allow ports and protocols for web instance"
}

variable "ports" {
  type        = list(number)
  description = "these are port numbers for the instance"
  default     = [443, 80]
}

variable "cidr_blocks" {
  type        = list(string)
  description = "these are cidr blocks for corresponding ports"
  default     = ["0.0.0.0/0", "0.0.0.0/0"]
}

variable "ingress_ip_protocol" {
  type        = string
  description = "protocol for the ingress ports"
  default     = "tcp"
}

variable "cidr_ipv4" {
  type        = string
  description = "these are cidr blocks for corresponding ports"
  default     = "0.0.0.0/0"
}

variable "egress_ip_protocol" {
  type        = string
  description = "protocol for the egress ports"
  default     = "-1"
}

# ===== ALB Target Group Variables =====

variable "lb_tg_type" {
  type        = string
  description = "target group type for web app"
  default     = "instance"
}

variable "lb_tg_port" {
  type        = number
  description = "this is port number for target group"
  default     = 80
}

variable "lb_tg_protocol" {
  type        = string
  description = "target group protocol web app"
  default     = "HTTP"
}

# ============ Subnet Variables ==================

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "these are cidr blocks assigned to public subnets"
  default     = ["172.31.48.0/24", "172.31.64.0/24"] # Change as needed
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

# ============ A Record Variables =================

variable "domain_name" {
  type        = string
  description = "domain name used web app"
  default     = "cloudinjen.com"
}

variable "record_type" {
  type        = string
  description = "record type for route53 record registration"
  default     = "A"
}

variable "evaluate_target_health" {
  type        = bool
  description = "for checking the health of the resource record set"
  default     = true
}

# ============= Auto Scaling Group(ASG) Variables =============

variable "asg_availability_zone" {
  type        = list(string)
  description = "these are availability zones for asg"
  default     = ["us-east-2a", "us-east-2b"]
}

variable "asg_desired_capacity" {
  type        = number
  description = "this is the desired capacity of instances for asg"
  default     = 1
}

variable "asg_max_size" {
  type        = number
  description = "this is the max size of instances for asg"
  default     = 3
}

variable "asg_min_size" {
  type        = number
  description = "this is the main size of instances for asg"
  default     = 1
}

variable "launch_template_version" {
  description = "The version of the launch template to use"
  type        = string
  default     = "$Latest"
}


# ============= ASG Launch Template Variables ==================

variable "lt_image_id" {
  type        = string
  description = "image id for asg fleet"
  default     = "ami-0f5daaa3a7fb3378b"
}

variable "lt_instance_type" {
  type        = string
  description = "instance type for asg fleet"
  default     = "t2.micro"
}

variable "public_ip_association" {
  type        = bool
  description = "for associating public ip address onto asg instances"
  default     = true
}

# ============ Providers ===========

variable "region" {
  type        = string
  description = "this is the selected region for infra"
  default     = "us-east-2"
}
# ============ Tags ================

variable "team" {
  type    = string
  default = "devops"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "app" {
  type    = string
  default = "backend"
}

variable "project" {
  type    = string
  default = "web"
}

variable "managed_by" {
  type    = string
  default = "terraform"
}

variable "owner" {
  type    = string
  default = "sedat"
}

variable "resource_type" {
  type    = string
  default = "instance"
}

# =============== Extra tags ================

variable "extra_tags" {
  default = [
    {
      key                 = "env"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "team"
      value               = "devops"
      propagate_at_launch = true
    },
    {
      key                 = "app"
      value               = "backend"
      propagate_at_launch = true
    },
    {
      key                 = "project"
      value               = "tom"
      propagate_at_launch = true
    },
    {
      key                 = "managed_by"
      value               = "terraform"
      propagate_at_launch = true
    },
    {
      key                 = "owner"
      value               = "sedat"
      propagate_at_launch = true
    }
  ]
}