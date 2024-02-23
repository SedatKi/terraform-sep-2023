terraform {
    backend "s3" {
        bucket = "terraform-backend-sep-2023-sedat"
        key = "session-3/terraform.tfstate"
        region = "us-east-2"
    }
}