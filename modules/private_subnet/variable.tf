variable "name" {
  default = "private"
}
variable "tenant" {
  default = "ee"
}
variable "vpc_id" {}
variable "env" {}
variable "id" {}
#variable "region" {}
variable "nat_subnet_id" {}

variable "cidrs" {
	type = list
	default = ["10.20.3.0/24", "10.20.4.0/24"]
}

variable "azs" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}
