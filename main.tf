module "vpc" {
  source   = "./modules/aws_vpc/"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_ip_cidr
  tags     = var.tags
}



resource "random_string" "password" {
  length      = 16
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
  special     = false
}



module "AD" {
  source   = "./modules/AD/"
  dir_domain_name       = "${var.dir_domain_name}"
  dir_admin_password   = "${var.dir_admin_password}"
  short_name = "corp"
  subnet_ids = "${module.vpc.private_subnets}"
  vpc_id     = "${module.vpc.vpc_id}"
}
