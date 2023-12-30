variable "lambda_arn" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "schedule" {
  type = string
}

variable "event_pattern" {
  type = string
}

# variable "event_input" {
#   type = string
# }

variable "function_name" {
  type = string
}

# variable "tags" {
#   type = map(any)
# }