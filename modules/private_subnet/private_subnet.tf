resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "ee" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = var.nat_subnet_id
  tags = {
    "Name" = "${var.tenant}-nat-gw"
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.cidrs,count.index)
  availability_zone       = element(var.azs,count.index)
  map_public_ip_on_launch = false

  tags   = {
    Name = "${var.tenant}-private-subnet-${count.index+1}"
  }
}

#route_table creation

resource "aws_route_table" "private_rt" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_nat_gateway.ee.network_interface_id
  }
  tags = {
    Name = "${var.env}-${var.tenant}-private-rt"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#route_table association
resource "aws_route_table_association" "private" {
  count          = length(var.cidrs)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id

  lifecycle {
    create_before_destroy = true
  }
}

#output RT
output "private_route-table" {
  value = aws_route_table.private_rt.id
}

output "nat_gateway_ip" {
  value = aws_eip.nat_gateway.public_ip
}

output "subnet_ids" {
  value =  aws_subnet.private.*.id
}

###############

