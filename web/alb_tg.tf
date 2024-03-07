resource "aws_lb_target_group" "main" {
  name        = replace(local.name, "sg", "tg")
  target_type = var.lb_tg_type
  port        = var.lb_tg_port
  protocol    = var.lb_tg_protocol
  vpc_id      = data.aws_vpc.default.id
  tags = local.common_tags
}