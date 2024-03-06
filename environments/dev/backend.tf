terraform {
  backend "s3" {
    bucket = "terraform-backend-sep-2023-sedat"
    key    = "session-5/dev/modules/terraform.tfstate"
    region = "us-east-2"
  }
}