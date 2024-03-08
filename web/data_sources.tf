data "aws_vpc" "default" {
  default = var.default_feature
}

data "aws_route53_zone" "main" {
  name = var.domain_name
}

data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default.id]
  }
}