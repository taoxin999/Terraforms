# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}

provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "hello_lambda.py"
  output_path = "hello_lambda.zip"
}

# data "aws_iam_policy_document" "policy" {
#   statement {
#     sid    = ""
#     effect = "Allow"

#     principals {
#       identifiers = ["lambda.amazonaws.com"]
#       type        = "Service"
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "iam_for_lambda" {
#   name               = "iam_for_lambda"
#   assume_role_policy = data.aws_iam_policy_document.policy.json
# }

resource "aws_lambda_function" "lambda" {
  function_name = "hello_tao_lambda"

  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256

  #{aws_iam_role.iam_for_lambda.arn}"
  role    = "arn:aws:iam::993314726416:role/service-role/reporting-scheuler-lab-role-yckaqz5a"
  handler = "hello_lambda.lambda_handler"
  runtime = "python3.8"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
}
