// Virtual Machine, Security Group, Rules, Key Pair

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "main" {
  public_key = file(var.public_key_path)
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.main.id
  tags = {
    Name = "Unstable Instance"
  }
}

resource "aws_instance" "web_stable" {
  ami = "ami-0e0bf53f6def86294"
  instance_type = "t2.micro"
  tags = {
    Name = "Stable Instance"
  }
}