data "aws_availability_zones" "available_az" {
}

locals {
  private_cidr     = cidrsubnet(var.vpc_cidr, 1, 1)
  private_bit_diff = var.private_subnet_size - element(split("/", local.private_cidr), 1)
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      "Name" = var.vpc_name
    },
  )
}



resource "aws_subnet" "private_subnets" {
  count             = var.az_count * (var.enable_private_subnets == "true" ? 1 : 0)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(local.private_cidr, local.private_bit_diff, count.index)
  availability_zone = data.aws_availability_zones.available_az.names[count.index]

  tags = merge(
    var.tags,
    {
      "Name" = "${var.vpc_name}-private-${count.index + 1}"
    },
  )
}




resource "aws_route_table" "private_route" {
  count  = var.az_count * (var.enable_private_subnets == "true" ? 1 : 0)
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.tags,
    {
      "Name" = "${var.vpc_name}-private-rt-${count.index + 1}"
    },
  )
}


resource "aws_route_table_association" "private_route_assoc" {
  count          = var.az_count * (var.enable_private_subnets == "true" ? 1 : 0)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.private_route.*.id, count.index)
}
