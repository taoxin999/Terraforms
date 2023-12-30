resource "aws_lambda_function" "lambda" {
  function_name = "tao_ecr_lambda"
  image_uri     = "${aws_ecr_repository.noiselesstech.repository_url}:latest"
  package_type  = "Image"
  timeout       = 5 # seconds

  #{aws_iam_role.iam_for_lambda.arn}"
  role    = "arn:aws:iam::993314726416:role/service-role/reporting-scheuler-lab-role-yckaqz5a"
  handler = "main.lambda_handler"
  runtime = "python3.8"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
}
