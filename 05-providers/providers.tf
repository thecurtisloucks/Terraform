terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Default AWS provider
provider "aws" {
  region = "us-west-2"
}

# Aliased provider for us-east-1
provider "aws" {
  alias  = "us-east"
  region = "us-east-1"
}

resource "aws_s3_bucket" "us_west_2" {
  bucket = "some-random-bucket-1--ff-f"
  # Uses default provider
}

resource "aws_s3_bucket" "us_east_1" {
  bucket   = "some-random-bucket-2f-f-f-f-f"
  provider = aws.us-east
}
