terraform {
  required_version = ">= 1.7.0"
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

  backend "s3" {
    bucket = "terraform-course-loucks-remote-backend"
    key    = "04-backends/state.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

