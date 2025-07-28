terraform {
  required_version = ">= 1.7.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}


# AMI ID us-west-2: ami-0597e0308dc02ed24
# AMI ID: us-west-1: ami-046070fb756e4377e

provider "aws" {
  region = "us-west-2"
}
