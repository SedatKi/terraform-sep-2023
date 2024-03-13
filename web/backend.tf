terraform {
  backend "s3" {
    bucket = "terraform-backend-sep-2023-sedat"
    key    = "project-a/dev/terraform.tfstate"
    region = "us-east-2"
  }
}