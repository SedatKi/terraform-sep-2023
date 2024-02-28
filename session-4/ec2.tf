resource "aws_instance" "main" {
  count = 1
  ami           = data.aws_ami.amazon_linux_2.image_id # Reference to Data Source
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data = data.template_file.userdata.rendered
  tags = {
    Name = "${var.env}-instance"
    Name2 = format("%s-instance", var.env) # dev-instance  // %s for string
    Name3 = format("%d instance", 1)       # 1 instance  // %d for number/integer
    Environment = var.env # Reference to Input Variable 
  }
  lifecycle { 
    create_before_destroy = true
  }
}

# Reference to data source

# resource "aws_ami" "amazon_linux_2" = create and manage the image
# reference: first_label.second_label.attribute

# data "aws_ami" "amazon_linux_2" = retreive the data from ami
# reference: data.first_label.second_label.attribute