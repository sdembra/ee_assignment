variable "tenant" {
  default = "ee"
}
variable "vpc_id" {}
variable "env" {}
variable "id" {}

variable "cidrs" {
	type = list
	default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}

