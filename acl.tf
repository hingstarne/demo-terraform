resource "aws_network_acl" "main" {
    vpc_id = "${aws_vpc.main.id}"
    tags {
        Name = "${var.vpc_name}-acl"
    }
}
resource "aws_network_acl_rule" "egress" {
    network_acl_id = "${aws_network_acl.main.id}"
    rule_number = 100
    egress = true
    protocol = "-1"
    rule_action = "allow"
    cidr_block = "0.0.0.0/0"
}
resource "aws_network_acl_rule" "ingress" {
    network_acl_id = "${aws_network_acl.main.id}"
    rule_number = 100
    egress = false
    protocol = "-1"
    rule_action = "allow"
    cidr_block = "0.0.0.0/0"
}
