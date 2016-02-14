resource "aws_network_acl" "main" {
    vpc_id = "${aws_vpc.main.id}"
    egress {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        cidr_block =  "0.0.0.0/0"
    }

    ingress {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        cidr_block =  "0.0.0.0/0"
    }

    tags {
        Name = "${var.vpc_name}-acl"
    }
}
