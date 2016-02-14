#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------
resource "aws_vpc" "main" {
    cidr_block = "10.100.0.0/16"
    enable_dns_hostnames = true
    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_subnet" "Subnet1a" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.100.0.0/24"
    availability_zone = "eu-west-1a"
    tags {
        Name = "${var.vpc_name}-subnet-1a"
    }
}

resource "aws_subnet" "Subnet1b" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.100.1.0/24"
    availability_zone = "eu-west-1b"
    tags {
        Name = "${var.vpc_name}-subnet-1b"
    }
}

resource "aws_subnet" "Subnet1c" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.100.2.0/24"
    availability_zone = "eu-west-1c"
    tags {
        Name = "${var.vpc_name}-subnet-1c"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.main.id}"
    tags {
        Name = "${var.vpc_name}-igw"
    }
}

resource "aws_route_table" "r" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
    tags {
        Name = "${var.vpc_name}-rt"
    }
}

resource "aws_main_route_table_association" "a" {
    vpc_id = "${aws_vpc.main.id}"
    route_table_id = "${aws_route_table.r.id}"
}
