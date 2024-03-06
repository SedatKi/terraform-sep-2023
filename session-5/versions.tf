terraform {
  required_version = "~> 1.5.0" # Terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36.0" # Provider version, AWS
    }
  }
}

# Semantic versioning
# v1.5.0 = Terraform version
# 1 = Major - Significant changes, upgrading, breaking changes
# 5 = Minor - Includes new features, updating, feature changes
# 0 = Patch - Bug fix, vulnerability fixes, patching, security changes

# Lazy constraints = ~>
# Example: ~> 1.5.0 