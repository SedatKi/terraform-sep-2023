resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "${var.env}-public_rt"
  }
}

# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = aws_vpc.main.cidr_block
#     nat_gateway_id = aws_nat_gateway.nat_gw.id
#   }

#   tags = {
#     Name = "${var.env}-public_rt"
#   }
# }