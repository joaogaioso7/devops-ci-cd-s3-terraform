terraform {
  backend "s3" {
    bucket  = "my-terraform-save-state-test"
    region  = "us-east-1"
    key     = "s3-github-action/terraform.tfstate"
    encrypt = false
  }
}