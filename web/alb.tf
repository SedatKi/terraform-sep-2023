resource "aws_lb" "main" {
  name                       = replace(local.name, "sg", "alb")
  internal                   = var.internal_feature
  load_balancer_type         = var.lb_type
  security_groups            = [aws_security_group.main.id]
  subnets                    = var.subnets
  enable_deletion_protection = false

  tags = local.common_tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.http_port
  protocol          = var.http_protocol
  default_action {
    type = var.routing_type
    redirect {
      port        = var.https_port
      protocol    = var.https_protocol
      status_code = var.redirect_status_code
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.https_port
  protocol          = var.https_protocol
  certificate_arn   = aws_acm_certificate.acm.arn
  default_action {
    type             = var.routing_action
    target_group_arn = aws_lb_target_group.main.arn
  }
}