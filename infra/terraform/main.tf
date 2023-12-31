terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13.1"
    }
  }

  required_version = ">= 1.5.5"
}

provider "aws" {
  region = "eu-west-3"
}