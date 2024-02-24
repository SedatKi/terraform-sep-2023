resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main_internet_gw"
  }
}

# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = aws_eip.nat_gateway_eip.id
#   subnet_id     = aws_subnet.private.id

#   tags = {
#     Name = "gw NAT"
#   }

# #   # To ensure proper ordering, it is recommended to add an explicit dependency
# #   # on the Internet Gateway for the VPC.
# #   depends_on = [aws_internet_gateway.example]
# }