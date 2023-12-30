# application        = "DTCOM"
# component          = "dtcom-reporting"
# deploy_env         = "dev"
# db_suffix          = "dtbi"
# dtbi_secret_suffix = "147e"

requests = [
  {
    request_name     = "test-schedule"
    procedure_name   = null
    ads_extract_name = "ESNINCRSFTP"
    schema           = null
    schedule         = "cron(30 0 * * ? *)"
    event_file_prefix    = null
    file_name        = "^creditapp_esntial_.*[.]csv$"
    use_regex        = true
    sftp_host        = "sftp.fni-dev-east.cmnsvc"
    sftp_port        = 22
    sftp_directory   = "/caiSterling/fcaiSterling/contracts"
  }
# ,
#   {
#     request_name     = "test-event"
#     procedure_name   = null
#     ads_extract_name = "U2ECON"
#     schema           = "dsetlusr"
#     schedule         = null
#     event_file_prefix    = "pizzas/vehicles"
#     file_name        = null
#     use_regex        = null
#     sftp_host        = null
#     sftp_port        = null
#     sftp_directory   = null
#   }

]
