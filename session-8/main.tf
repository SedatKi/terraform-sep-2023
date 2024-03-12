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

variable "public_key_path" {
  default = "C:\\Users\\Sedat\\.ssh\\id_rsa.pub"
}

resource "aws_key_pair" "main" {
  public_key = file(var.public_key_path)
}

resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.main.id

  provisioner "file" {
    source      = "C:\\Users\\Sedat\\Desktop\\terraform-sep-2023\\session-8\\index.html" // The place where your file exist, path on my laptop
    destination = "/tmp/index.html"                                                      // The place where you want to send your file, path on the remote server

    connection {
      type        = "ssh"
      user        = "ec2-user"                             // Amazon Linux 2 = ec2-user, Ubuntu = ubuntu, Debian = admin, Centos = centos
      host        = self.public_ip                         // public ip of your web server    // self = aws_instance.main (reference)
      private_key = file("C:\\Users\\Sedat\\.ssh\\id_rsa") // private key of your Terraform server, local machine
    }
  }

  provisioner "remote-exec" { // WIll not be tracked in terraform.state file therefore changes are not tracked
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"                             // Amazon Linux 2 = ec2-user, Ubuntu = ubuntu, Debian = admin, Centos = centos
      host        = self.public_ip                         // public ip of your web server    // self = aws_instance.main (reference)
      private_key = file("C:\\Users\\Sedat\\.ssh\\id_rsa") // private key of your Terraform server, local machine
    }
  }
}

resource "null_resource" "main" { // null_resource Not tracked in tf.state
  provisioner "local-exec" {
    command = "echo 'this is a new file' >> newfile.txt" # Adjust the wait time according to your needs
  }
}