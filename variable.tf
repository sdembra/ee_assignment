variable "env" {}
variable "id" { default = "1"}

variable "tenant" {
  default = "ee"
}

variable "vpc_cidr" {}

variable "azs" {
  type = list
}

variable "region" {
  default = "us-east-1"
}

variable "private_subnets" {
  type = list
}

variable "public_subnets" {
  type = list
}

variable "ami_id" {
  default = "ami-81a3b9fa"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "user_data" {
  default = "user-data.tpl"
}
