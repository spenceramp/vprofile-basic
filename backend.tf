terraform {
  backend "s3" {
    bucket         = "sampofobackendbucket"
    key            = "vprofile/basic"
    region         = "us-east-1"
    dynamodb_table = "statelockingterraform"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
