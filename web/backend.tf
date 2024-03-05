terraform {
    backend "s3" {
        bucket = "terraform-backend-sep-2023-sedat"
        key = "web/terraform.tfstate"
        region = "us-east-2"
    }
}