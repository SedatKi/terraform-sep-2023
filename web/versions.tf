terraform {
  required_version = "~> 1.5.0"    # Terraform version
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.36.0"    # Provider version, AWS
    }
  }
}
