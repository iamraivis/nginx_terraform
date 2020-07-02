provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#resources
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr_block_range}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    environment = "${var.environment_tag}"
	project     = "${var.project_tag}"
	department  = "${var.department_tag}"
	}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    environment = "${var.environment_tag}"
	project     = "${var.project_tag}"
	department  = "${var.department_tag}"
	}
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet1_cidr_block_range}"
  map_public_ip_on_launch = true
  availability_zone       = "${var.availability_zone}"
  tags = {
    environment = "${var.environment_tag}"
	project     = "${var.project_tag}"
	department  = "${var.department_tag}"
	type        = "Public"
	}
}

resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.vpc.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.igw.id}"
	}

  tags = {
    environment = "${var.environment_tag}"
	project     = "${var.project_tag}"
	department  = "${var.department_tag}"
	}
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = "${aws_subnet.subnet_public.id}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}

