# VPC
output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}


## public subnets
output "public_subnet_ids"  { 
  value = "${module.public_subnet.subnet_ids}" 
}

output "private_subnet_ids"  { 
  value = "${module.private_subnet.subnet_ids}" 
}

output "jenkins_sg"  {
  value = "${module.securitygroup.ee-jenkins}" 
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}


