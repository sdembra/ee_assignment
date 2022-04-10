module "vpc" {
  source     = "./modules/vpc"
  env        = var.env
  id         = var.id
  cidr       = var.vpc_cidr
  region     = var.region
}

module "public_subnet" {
  source                = "./modules/public_subnet"
  tenant                = var.tenant
  vpc_id                = module.vpc.vpc_id
  cidrs                 = var.public_subnets
  azs                   = var.azs
  env                   = var.env
  id                    = var.id
}
#
module "private_subnet" {
  source               = "./modules/private_subnet"
  tenant               = var.tenant
  vpc_id               = module.vpc.vpc_id
  cidrs                = var.private_subnets
  azs                  = var.azs
  env                  = var.env
  id                   = var.id
  #nat_subnet_id        = "${module.public_subnet.ck-subnet-pub-az1}"
#  depends_on           = [module.public_subnet.subnet_ids]
  nat_subnet_id        = module.public_subnet.subnet_ids[0]
}
#
module "securitygroup" {
  source = "./modules/securitygroup"
  tenant = "${var.tenant}-SG"
  vpc_id = "${module.vpc.vpc_id}"
  env    = "${var.env}"
  id     = "${var.id}"
}
