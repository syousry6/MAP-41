output "vpc_id" {
  value = module.vpc.vpc_id
}


output "private_subnets" {
  value = module.vpc.private_subnets
}



output "private_routes" {
  value = module.vpc.private_routes
}


output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}


output "access_url" {
  description = "The access URL for the directory"
  value       = module.AD.access_url
}

output "dns_ip_addresses" {
  description = "A list of IP addresses of the DNS servers for the directory or connector"
  value       = module.AD.dns_ip_addresses
}

output "id" {
  description = "The directory identifier."
  value       = module.AD.id
}

output "security_group_id" {
  description = "The ID of the security group created by the directory"
  value       = module.AD.security_group_id
}

