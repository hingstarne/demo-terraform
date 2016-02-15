module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name = "${var.vpc_name}"
  cidr = "10.100.0.0/16"
  private_subnets = "10.100.1.0/24,10.100.2.0/24,10.100.3.0/24"
  public_subnets  = "10.100.101.0/24,10.100.102.0/24,10.100.103.0/24"
  azs      = "eu-west-1a,eu-west-1b,eu-west-1c"
}