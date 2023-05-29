## This is me using a module created by Terraform (terraform-aws-modules/vpc)

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"
}

## This is me creating the region
provider "aws" {
  region = "us-west-2" # Set your desired region
}

## This is for Creating bucket in AWS

resource "random_pet" "bucket_name" {
  length    = 2
  separator = "-"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-bucket-${random_pet.bucket_name.id}"
  acl    = "private"
}

module "my_module" {
  source       = "./Mymodule"  # Set the path to your module directory
  subnet_id = "subnet-0a8c2be4316152609"
  key_pair = "Keypair"
}

# output "module_instance_id" {
#   description = "ID of the instance created by the module"
#   value       = module.my_module.instance_id
# }

