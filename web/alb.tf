resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = var.internal_feature
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.main.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

### //// WORK IN PROGRESS /////  NOT FINAL /////