resource "aws_security_group" "main" {
  vpc_id      = data.aws_vpc.default.id
  name        = local.name
  description = var.lb_sg_description
  tags        = local.common_tags
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  for_each          = { for i, port in var.ports : i => port }
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = var.cidr_blocks[each.key]
  from_port         = each.value
  ip_protocol       = var.ingress_ip_protocol
  to_port           = each.value
}

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.egress_ip_protocol
}
