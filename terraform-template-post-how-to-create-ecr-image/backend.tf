terraform {
  backend "s3" {
    bucket = "reportinguma"
    key    = "terraform.state"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

// All infra is over AWS and is the provider used by default.
provider "aws" {
  region = "us-east-1"
}

// Used by get the current aws number account.
data "aws_caller_identity" "current" {
}