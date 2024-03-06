locals {
  // first local value: naming standard
  name = "aws-${var.team}-${var.env}-${var.app}-rtype-${var.project}"
  common_tags = {
    Environment = var.env,
    Team        = var.team,
    Application = var.app,
    Project     = var.project,
    Managed_By  = var.managed_by,
    Owner       = var.owner
  }
}