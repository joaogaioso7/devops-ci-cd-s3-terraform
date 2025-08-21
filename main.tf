terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      owner      = "gaioso"
      managed-by = "terraform-actions"
    }
  }
}