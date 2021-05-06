/**
* # aws-terraform-microsoft_ad
*
* This module will create a Microsoft Active Directory using AWS Directroy Services.
*
* ## Basic Usage
*
* ```
* module "msad" {
*   source     = "git@github.com:syousry6/MAP-41/modules/AD//?ref=v0.12.0"
*   name       = "corp.example.test"
*   password   = "${data.aws_kms_secrets.ad_credentials.plaintext["password"]}"
*   short_name = "corp"
*   subnet_ids = "${module.vpc.private_subnets}"
*   vpc_id     = "${module.vpc.vpc_id}"
* }
* ```
*/

terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 2.1.0"
  }
}



resource "aws_directory_service_directory" "msad" {
  alias       = var.alias
  description = var.description
  edition     = var.edition
  enable_sso  = var.enable_sso
  name        = var.dir_domain_name
  password    = var.dir_admin_password
  short_name  = var.short_name
  type        = "MicrosoftAD"

  vpc_settings {
    subnet_ids = var.subnet_ids
    vpc_id     = var.vpc_id
  }


  tags = {
    Environment     = var.environment
    Name            = var.dir_domain_name
    ServiceProvider = "Rackspace"
  }
}

