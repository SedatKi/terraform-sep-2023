module "vpc" {
  #################### Module Argument ######################
  source = "../../modules/vpc" // must be there (required argument), where you specify your child module
  //  version =           // optional argument (not required), specify the specific version of your code
  #################### Input Variables that are required for the child module ######################
  aws_region           = "us-east-2"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

module "web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "web"

  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_0 // module.module_name.output_name
}

// Child module can be called locally or remotely
// If you are calling your child module locally, in the source, you need to specify a path to your module