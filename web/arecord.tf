resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.main
  name    = "www.cloudinjen.com"
  type    = "A"
  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "example_root" {
  zone_id = data.aws_route53_zone.example_zone.zone_id
  name    = "cloudinjen.com"
  type    = "A"
  alias {
    name                   = aws_lb.example.dns_name
    zone_id                = aws_lb.example.zone_id
    evaluate_target_health = true
  }
}