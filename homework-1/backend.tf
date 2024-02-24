terraform {
    backend "s3" {
        bucket = "terraform-backend-sep-2023-sedat"
        key = "homework-1/terraform.tfstate"
        region = "us-east-2"
    }
}