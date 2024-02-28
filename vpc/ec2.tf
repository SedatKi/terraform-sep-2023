resource "aws_instance" "main" {
  ami           = var.main_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id              = aws_subnet.public[0].id
  user_data              = "${file("install_apache.sh")}"
  tags = {
    Name = "${var.env}-instance"
    Environment = var.env # Reference to Input Variable 
  }
}
