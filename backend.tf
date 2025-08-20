terraform {
  backend "s3" {
    bucket  = "my-terraform-save-state-test"
    region  = "us-east-1"
    key     = "s3-github-action/terraform.tfstate"
    encrypt = false
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}