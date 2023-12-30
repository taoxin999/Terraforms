variable "ami" {
  type        = string
  description = "Ubuntu AMI ID in N. Virginia Region"
  default     = "ami-0b0ea68c435eb488d"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "Tao EC2 Instance"
}

# variable "requests" { 
#   [
#   {
#     request_name            = "test-schedule"
#     procedure_name          = null
#     ads_extract_name        = "ESNINCRSFTP"
#     schema                  = null
#     schedule                = "cron(0/15 * * * ? *)"
#     event_pattern           = null
#     file_name               = "^creditapp_esntial_.*[.]csv$"
#     use_regex               = true
#     sftp_host               = "sftp.fni-dev-east.cmnsvc"
#     sftp_port               = 22
#     sftp_directory          = "/caiSterling/fcaiSterling/contracts"
#   },
#   {
#    request_name            = "test-event"
#    procedure_name          = "SP_DTAS_ECON_EXPORT_INCR"
#    ads_extract_name        = "U2ECON"
#    schema                  = "dsetlusr"
#    schedule                = null   
#    event_pattern           = "econtract_"
#    file_name               = null
#    use_regex               = null
#    sftp_host               = null
#    sftp_port               = null
#    sftp_directory          = null
#   }

# ]
# }


# variable "lambda_arn" {
#   type = string
# }

# variable "name_prefix" {
#   type = string
# }

# variable "schedule" {
#   type = string
# }

# variable "event_pattern" {
#   type = string
# }

# variable "event_input" {
#   type = string
# }

# variable "function_name" {
#   type = string
# }

# variable "tags" {
#   type = map(any)
# }


variable "requests" {
  type = list(object({
    request_name      = string
    procedure_name    = string
    ads_extract_name  = string
    schema            = string
    schedule          = string
    event_file_prefix = string
    file_name         = string
    use_regex         = bool
    sftp_host         = string
    sftp_port         = number
    sftp_directory    = string
  }))
}