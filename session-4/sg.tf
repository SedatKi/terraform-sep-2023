resource "aws_security_group" "main" {
  name        = "${var.env}-instance-sg"
  description = "Allow ports and protocols for web instance"

  tags = {
    Name = "${var.env}-instance-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  count = length(var.ports)  # ----->>> length of given list, map or string
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = element( var.cidr_blocks, count.index )
  from_port         = element( var.ports, count.index )
  ip_protocol       = "tcp"
  to_port           = element( var.ports, count.index )
}

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports. Protocol : http, https, tcp, udp,icmp
                           # -1 means all protocols
}


# Security Group: Always allow the rules, there is no deny, You only manage inbound rules, not outbound, whatever you add in
# NACL: Allow or Deny, Priority starting from Rule 100, you manage both inbound and outbound rules, tied to subnets