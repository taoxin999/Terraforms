locals {
  #   application = var.application
  #   component   = "${var.component}-lambda"
  #   team        = "Reporting"
  #   email       = ""
  #   tags = {
  #     Application = local.application
  #     Component   = local.component
  #     Team        = local.team
  #     Stack       = var.stack
  #     Environment = var.deploy_env
  #     Region      = var.region
  #   }
  #   region_map = {
  #     "us-east-1" = "east"
  #     "us-west-2" = "west"
  #   }
  #   region_code      = local.region_map[var.region]
  name_prefix = "tf_test"
  #   sid_prefix       = replace(title(local.name_prefix), "-", "")
  #   artifactory_user = jsondecode(data.aws_secretsmanager_secret_version.artifactory_creds.secret_string)["username"]
  #   artifactory_pass = jsondecode(data.aws_secretsmanager_secret_version.artifactory_creds.secret_string)["password"]

  batch_bucket_name = "pizza-luvrs-a-unique-string-tao"
  #   cloud_trail_bucket = "${data.aws_iam_account_alias.current.account_alias}-logs-coxautomotive"

}