data "aws_ami" "amazon_linux_2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.*"] 
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "userdata" {  # Creating a data source of a shell script file
    template = file("userdata.sh")
    vars = {
        env = var.env
    # variable that will be used in userdata.sh = terraform variable
    }
}