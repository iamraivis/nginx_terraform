provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_security_group" "sg_22" {
  name   = "sg_22"
  vpc_id = "${var.vpc_id}"

  # SSH acces from the VPC
  ingress {
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  
  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    environment = "${var.environment_tag}"
	project     = "${var.project_tag}"
	department  = "${var.department_tag}"
	}
}
resource "aws_security_group" "sg_80" {
  name   = "sg_80"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port    = 80
    to_port      = 80
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  
  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    environment = "${var.environment_tag}"
	project     = "${var.project_tag}"
	department  = "${var.department_tag}"
	}
}
resource "aws_security_group" "sg_https" {
  name   = "sg_https"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port    = 443
    to_port      = 443
    protocol     = "https"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  
  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sg_http" {
  name   = "sg_http"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port    = 80
    to_port      = 80
    protocol     = "http"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  
  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}	
