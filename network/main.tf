resource "aws_vpc" "project01-vpc" {
  cidr_block = var.vpc_cidr
  assign_generated_ipv6_cidr_block = var.using_ipv6
  enable_classiclink = var.enable_classiclink
  enable_dns_hostnames = var.enable_dns_hostname
  enable_dns_support = var.enable_dns_support
  instance_tenancy = var.ins_tenancy
  tags = {
    "Name" = "${var.env_name["project_name"]}.${var.env_name["vpc_name"]}"
  }
}

resource "aws_subnet" "project01-public-subnet" {
  vpc_id = aws_vpc.project01-vpc.id
  count = var.subnet_count
  cidr_block = var.public_subnet_cidr[count.index]
  map_public_ip_on_launch = var.enable_map_public_ip
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
    "Name" = "${var.env_name["project_name"]}.${var.env_name["public_subnet_name"]}.${count.index}"
  }
}

resource "aws_subnet" "project01-private-subnet" {
  vpc_id = aws_vpc.project01-vpc.id
  count = var.subnet_count
  cidr_block = var.private_subnet_cidr[count.index]
  map_public_ip_on_launch = var.disable_map_public_ip
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
      "Name" = "${var.env_name["project_name"]}.${var.env_name["private_subnet_name"]}.${count.index}"
  }
}
resource "aws_eip" "project01-natgw-eip" {
    vpc = true
    tags = {
      "Name" = "${var.env_name["project_name"]}.${var.env_name["eip_natgw_name"]}"
    }
}

resource "aws_internet_gateway" "project01-internetgw" {
    vpc_id = aws_vpc.project01-vpc.id
    tags = {
        "Name" = "${var.env_name["project_name"]}.${var.env_name["internet_gateway_name"]}"
    }
}
resource "aws_nat_gateway" "project01-natgw" {
    allocation_id = aws_eip.project01-natgw-eip.id
    subnet_id = aws_subnet.project01-public-subnet.*.id[0]
    tags = {
      "Name" = "${var.env_name["project_name"]}.${var.env_name["nat_gateway_name"]}"
    }
}
resource "aws_default_route_table" "default-route" {
   default_route_table_id = aws_route_table.project01-public-route.id
   route {
       cidr_block = var.default_route_cidr
       gateway_id = aws_internet_gateway.project01-internetgw.id 
    }
   tags = {
     "Name" = "${var.env_name["project_name"]}.${var.env_name["default_routetb_name"]}"
   }
}
resource "aws_route_table" "project01-public-route" {
   vpc_id = aws_vpc.project01-vpc.id
}

resource "aws_route_table" "project01-private-route" {
    vpc_id = aws_vpc.project01-vpc.id
    route {
        cidr_block = var.default_route_cidr
        gateway_id = aws_nat_gateway.project01-natgw.id 
    }
    tags = {
        "Name" = "${var.env_name["project_name"]}.${var.env_name["private_routetb_name"]}"
    }
}

resource "aws_route_table_association" "project01-public-rta" {
    count = var.rta_count
    route_table_id = aws_default_route_table.default-route.id
    subnet_id = element(aws_subnet.project01-public-subnet.*.id , count.index)
    depends_on = [ aws_default_route_table.default-route , aws_subnet.project01-public-subnet ]
}
resource "aws_route_table_association" "project01-private-rta" { 
    count = var.rta_count
    route_table_id = aws_route_table.project01-private-route.id
    subnet_id = element(aws_subnet.project01-private-subnet.*.id , count.index)
    depends_on = [ aws_route_table.project01-private-route , aws_subnet.project01-private-subnet ]
}
  

