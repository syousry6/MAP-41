variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "user1"
}


variable "tags" {
  description = "Tags to propogate to all supported resources"
  type        = map(string)

  default = {
    Env        = "dev"
    managed-by = "Terraform"
  }
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC being deployed"
  default     = "celink_vpc"
}

variable "vpc_ip_cidr" {
  type        = string
  description = "IP CIDR assigned to the environment"
  default     = "10.0.0.0/16"
}


# Directory Service
variable "dir_domain_name" {}
variable "dir_admin_password" {}



