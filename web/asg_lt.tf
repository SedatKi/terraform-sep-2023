resource "aws_launch_template" "main" {
  name          = replace(local.name, "sg", "lt")
  image_id      = var.lt_image_id
  instance_type = var.lt_instance_type

  network_interfaces {
    associate_public_ip_address = var.public_ip_association
    security_groups             = [aws_security_group.main.id]
  }

  update_default_version = var.update_default_version

  tag_specifications {
    resource_type = var.resource_type
    tags          = local.common_tags
  }

  user_data = filebase64("install_apache.sh")
}