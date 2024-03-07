module "vpc" {
  source = "github.com/SedatKi/terraform-sep-2023//modules/vpc?ref=v0.0.2" 
  aws_region           = "us-east-2"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
// github.com = Domain name
// SedatKi = username name
// terraform = Repository name
// tree = ?
// main = Branch 
// modules = Directory
// vpc = Subdirectory

// Revision

# prod = v0.0.1
# stage = v0.0.2
# qa = v0.0.3
# dev = v0.0.4

# Terraform does not have automated rollback, but Cloudformation does.
# Application rollback vs Infra rollback

# ############## Count Meta Argument ############
# module "bucket" {
#   count = length(var.bucket_names)
#   source = "./publish_bucket"
#   name = element(var.bucket_names, count.index)
# }

# variable "bucket_names" {
#   type = list
#   default = ["bucket1, bucket2, bucket3"]
# }


# ############## Count Meta Argument ############

# module "bucket" {
#   for_each = var.bucket_names
#   source = "./publish_bucket"
#   name = each.key
# }

# variable "bucket_names" {
#   type = list
#   default = ["bucket1, bucket2, bucket3"]
# }

# for each + for loop + 