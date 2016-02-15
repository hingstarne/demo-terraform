module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name = "${var.vpc_name}"
  cidr = "10.100.0.0/16"
  private_subnets = "10.100.1.0/24,10.100.2.0/24,10.100.3.0/24"
  public_subnets  = "10.100.101.0/24,10.100.102.0/24,10.100.103.0/24"
  azs      = "eu-west-1a,eu-west-1b,eu-west-1c"
  enable_dns_hostnames = true
  enable_dns_support = true
}

module "ami" {
  source = "modules/aws/coreosami"
  region = "${var.vpc_region}"
  channel = "${var.coreos_channel}"
  virttype = "hvm"
}

resource "aws_network_acl" "main" {
    vpc_id = "${module.vpc.vpc_id}"
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