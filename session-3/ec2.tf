# resource "aws_instance" "main" {
#   ami           = "ami-05fb0b8c1424f266b"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.main.id]
#   tags = {
#     Name = "${var.env}-instance"
#     Environment = var.env # Reference to Input Variable 
#   }
# }

# Reference to Resource:
# Cloudformation: !Ref, !Getatt
# Terraform