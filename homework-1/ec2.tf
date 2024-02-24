resource "aws_instance" "main" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name      = "sedat@windows"
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id              = aws_subnet.public[0].id
  user_data              = <<EOF
    sudo yum update -y
    sudo yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "Task is done" > /var/www/html/index.html
  EOF
  tags = {
    Name = "${var.env}-instance"
    Environment = var.env # Reference to Input Variable 
  }
}
