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
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "redirect"
    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.acm.arn
  default_action {
    type             = var.routing_action
    target_group_arn = aws_lb_target_group.main.arn
  }
}