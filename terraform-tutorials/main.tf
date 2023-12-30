resource "aws_instance" "my_vm" {
  ami           = var.ami //Ubuntu AMI
  instance_type = var.instance_type

  tags = {
    Name = var.name_tag,
  }
}


# data "aws_region" "current" {}

# data "aws_caller_identity" "this" {}

# data "aws_ecr_authorization_token" "token" {}

module "lambda_function_container_image" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda-existing-package-local"
  description   = "My awesome lambda function"

  create_package = false

  image_uri    = "132367819851.dkr.ecr.eu-west-1.amazonaws.com/complete-cow:1.0"
  package_type = "Image"
}
