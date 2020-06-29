terraform {
  backend "s3" {
    bucket = "tf-pipeline-source-bucket"
    key    = "tf-state/"
    region = "us-east-1"
    dynamodb_table = "tf-pipeline-terraform-lock"
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "test-tf-pipeline-bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "delete_me"
    Environment = "delete_me_please"
  }
}