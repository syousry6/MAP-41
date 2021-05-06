variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "user1"
}

variable "az_count" {
  description = "the number of AZs to deploy infrastructure to"
  default     = 2
}

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. ca-central-1)."
  default     = "us-east-1"
}


variable "vpc_cidr" {
  description = "CIDR associated with the VPC to be created"
  default     = "10.1.0.0/16"
}

variable "private_subnet_size" {
  default = 24
}


variable "enable_private_subnets" {
  type    = string
  default = "true"
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
