terraform {
  required_version = "~> 1.5.7" 
  required_providers {
    aws = {
      source  = "hashicorp/aws" # public registry
      version = "~> 5.36.0" 
    }
  }
}