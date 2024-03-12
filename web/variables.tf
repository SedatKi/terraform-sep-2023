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

variable "http_port" {
  type        = string
  description = "http port number for listener"
  default     = "80"
}

variable "http_protocol" {
  type        = string
  description = "http protocol type for listener"
  default     = "HTTP"
}

variable "redirect_status_code" {
  type        = string
  description = "The HTTP status code used for the redirect."
  default     = "HTTP_301"
}

variable "https_port" {
  type        = string
  description = "port number to redirect traffic to"
  default     = "443"
}

variable "https_protocol" {
  type        = string
  description = "https protocol type for listener"
  default     = "HTTPS"
}

variable "routing_type" {
  type        = string
  description = "routing action to taken by listener redirect port 80 traffic to port 443"
  default     = "redirect"
}

variable "routing_action" {
  type        = string
  description = "routing action taken by listener for incoming traffic, defaulting to 'forward'"
  default     = "forward"
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-0c6a84b8806057867", "subnet-0e3c1b30e91350711"]
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

# variable "public_subnet_cidrs" {
#   type        = list(string)
#   description = "these are cidr blocks assigned to public subnets"
#   default     = ["172.31.48.0/24", "172.31.64.0/24"] # Change as needed
# }

# variable "map_public_ip_on_launch" {
#   type    = bool
#   default = true
# }

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

# ============= ACM Variables ===========

variable "validation_method" {
  type        = string
  description = "validation method for creating acm certification"
  default     = "DNS"
}

variable "private_zone" {
  type        = bool
  description = "for creating a domain in a public zone"
  default     = false
}

variable "allow_overwrite" {
  type        = bool
  description = "allow overwrite of existing record, if any"
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
  description = "this is the min size of instances for asg"
  default     = 1
}

variable "lt_version" {
  description = "The version of the launch template to use"
  type        = string
  default     = "$Default"
}

variable "strategy_type" {
  description = "The type of strategy for instance refresh"
  type        = string
  default     = "Rolling"
}

variable "min_healthy_percentage" {
  type        = number
  description = "Min Capacity percentage in ASG that must remain healthy during an instance refresh to allow the operation to continue"
  default     = 50
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

variable "update_default_version" {
  type        = bool
  description = "whether to update default version with each update"
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

# ============ Uncategorized Variables =================
variable "internet_gateway_name" {
  type    = string
  default = "attachment.vpc-id"
}