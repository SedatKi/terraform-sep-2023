resource "aws_launch_template" "main" {
  name          = "web-app-lt"
  description   = "launch template for auto scaling group"
  image_id      = "ami-0f5daaa3a7fb3378b"
  instance_type = "t2.micro"

  # block_device_mappings {
  #   device_name = "/dev/sdf"

  #   ebs {
  #     volume_size = 20
  #   }
  # }

  # disable_api_stop        = true
  # disable_api_termination = true

  # ebs_optimized = true

  # instance_initiated_shutdown_behavior = "terminate"

  # metadata_options {
  #   http_endpoint               = "enabled"
  #   http_tokens                 = "required"
  #   http_put_response_hop_limit = 1
  #   instance_metadata_tags      = "enabled"
  # }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.main.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.env
    }
  }

  user_data = base64encode(file("install_apache.sh"))
}