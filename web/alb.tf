resource "aws_lb" "main" {
  name               = replace(local.name, "sg", "alb")
  internal           = var.internal_feature
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.main.id]
  subnets            = aws_subnet.public_subnets[*].id

  // Log storage for monitoring, troubleshooting, etc.
  # access_logs {
  #   bucket  = "terraform-backend-sep-2023-sedat"
  #   prefix  = "web"
  #   enabled = true
  # }

  tags = local.common_tags
}

# Configuration for ALB listener to forward traffic to the target group
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = var.routing_action
    target_group_arn = aws_lb_target_group.main.arn
  }
}