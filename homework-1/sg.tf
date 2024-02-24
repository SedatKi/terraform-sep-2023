resource "aws_security_group" "main" {
  vpc_id      = "vpc-0cf7206372d961221"
  name        = "dev-sg"
  description = "Allow ports and protocols for web instance"

  tags = {
    Name = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports. Protocol : http, https, tcp, udp,icmp
                           # -1 means all protocols
}
