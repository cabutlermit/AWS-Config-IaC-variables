provider "tfe" {
  hostname = var.hostname
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"

  shared_credentials_file = "/Users/cabutler/.aws/credentials"
  profile                 = "cabutlerinfra"
}
