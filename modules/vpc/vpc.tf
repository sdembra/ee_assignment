provider "aws"{
region = var.region
}


#VPC creation block
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.tenant}-${var.id}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

