resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"][count.index]
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}


resource "aws_route_table_association" "public_subnet_association" {
  count       = length(aws_subnet.public)
  subnet_id   = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
