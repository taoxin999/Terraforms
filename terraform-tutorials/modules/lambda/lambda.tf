
# resource "aws_lambda_function" "ReportingLambda" {
#   filename         = "./ReportingLambda.${var.lambda_version}.zip"
#   function_name    = local.name_prefix
#   role             = alks_iamrole.lambda_role.arn
#   handler          = "ReportingLambda::ReportingLambda.Function::FunctionHandler"
#   source_code_hash = data.artifactory_file.artifact.sha256
#   runtime          = "dotnet6"
#   timeout          = "900"
#   memory_size      = "1024"
#   publish          = true
#   environment {
#     variables = {
#       MY_ENV = var.deploy_env
#     }
#   }
#   vpc_config {
#     subnet_ids         = data.aws_subnet_ids.private_subnet_ids.ids
#     security_group_ids = [aws_security_group.lambda_sg.id]
#   }
#   depends_on = [aws_cloudwatch_log_group.lambda_log_group]
#   tags       = local.tags
# }

