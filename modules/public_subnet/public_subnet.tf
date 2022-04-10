
resource "aws_internet_gateway" "ee_igw" {
  vpc_id = var.vpc_id

  tags   = {
    Name = "${var.env}-{var.tenant}-igw"
  }
}

# public subnet creation

resource "aws_subnet" "public" {
  count                   = length(var.cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.cidrs,count.index)
  availability_zone       = element(var.azs,count.index)
  map_public_ip_on_launch = true

  tags   = {
    Name = "${var.tenant}-public-subnet-${count.index+1}"
  }
}

# Route table: attach Internet Gateway 

resource "aws_route_table" "public_rt" {
  vpc_id       = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ee_igw.id
  }

  tags   = {
    Name = "${var.tenant}-public-rt"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "public" {
  count          = length(var.cidrs)
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  route_table_id = aws_route_table.public_rt.id
}

#
#output subnet_id
output "subnet_ids" {
  value =  aws_subnet.public.*.id
}

