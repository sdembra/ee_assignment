#AWS Provider configuration
provider "aws" {
  region = "${var.region}"
}

#S3 backend configuration
#terraform {
#  backend "s3" {
#    bucket = ""
#    key = ""
#    region = "ap-southeast-1"
#  }
#}
