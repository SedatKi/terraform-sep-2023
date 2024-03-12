resource "aws_autoscaling_group" "main" {
  availability_zones = var.asg_availability_zone
  desired_capacity   = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size

  target_group_arns = ["${aws_lb_target_group.main.arn}"]

  launch_template {
    id      = aws_launch_template.main.id
    version = var.lt_version
  }

  dynamic "tag" {
    for_each = var.extra_tags
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.value
    }
  }

  instance_refresh {
    strategy = var.strategy_type
    preferences {
      min_healthy_percentage = var.min_healthy_percentage
    }
  }
}