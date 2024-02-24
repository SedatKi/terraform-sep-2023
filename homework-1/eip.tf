resource "aws_eip" "internet_gateway_eip" {
  instance = aws_instance.main.id
  domain   = "vpc"
}