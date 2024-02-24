# resource "aws_subnet" "private" {
#   count             = 3
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"][count.index]
#   availability_zone = "us-east-1"
# }

# resource "aws_route_table_association" "private_subnet_association" {
#   count       = length(aws_subnet.private)
#   subnet_id   = aws_subnet.private[count.index].id
#   route_table_id = aws_route_table.private_rt.id
# }
