data "aws_vpc" "default" {
  default = var.default_feature
}

data "aws_route53_zone" "main" {
  name = "cloudinjen.com"
}