output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_subnets" {
  value = aws_subnet.private_subnets.*.id
}


output "private_routes" {
  value = aws_route_table.private_route.*.id
}


output "vpc_cidr" {
  value = var.vpc_cidr
}

