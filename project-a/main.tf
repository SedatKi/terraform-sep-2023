module "sqs" {
    source = "terraform-aws-modules/sqs/aws"
    version = "4.1.1"

    name = "${var.env}-sqs-queue"
    tags = {
        Environment = var.env
        Workspace = terraform.workspace
    }
}