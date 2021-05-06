variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "user1"
}


variable "alias" {
  description = "A unique alias to assign to the Microsoft Active Directory in AWS. AWS Directory Service uses the alias to construct the access URL for the directory, such as http://alias.awsapps.com."
  type        = string
  default     = ""
}

variable "description" {
  description = "A textual description for the directory (OPTIONAL)"
  default     = ""
  type        = string
}

variable "edition" {
  description = "The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise."
  type        = string
  default     = "Enterprise"
}

variable "enable_sso" {
  description = "Whether to enable single sign-on for a Microsoft Active Directory in AWS. Single sign-on allows users in your directory to access certain AWS services from a computer joined to the directory without having to enter their credentials separately. If you don't specify a value, AWS CloudFormation disables single sign-on by default."
  type        = bool
  default     = false
}

variable "environment" {
  description = "Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test')"
  type        = string
  default     = "Development"
}


# Directory Service
variable "dir_domain_name" {
  description = "The fully qualified name for the Microsoft Active Directory in AWS, such as corp.example.com. The name doesn't need to be publicly resolvable; it will resolve inside your VPC only."
  type        = string
  default     = "celink.test"
}

variable "dir_admin_password" {
  description = "The password for the default administrative user, Admin."
  type        = string
  default     = "Sup3rS3cret"
}

variable "short_name" {
  description = "The NetBIOS name for your domain, such as CORP. If you don't specify a value, AWS Directory Service uses the first part of your directory DNS server name. For example, if your directory DNS server name is corp.example.com, AWS Directory Service specifies CORP for the NetBIOS name."
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "A list of at least two subnet IDs for the directory servers. Each subnet must be in different Availability Zones (AZs). AWS Directory Service creates a directory server and a DNS server in each subnet."
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID in which to create the Microsoft Active Directory server."
  type        = string
}







