#--------------------------------------------------------------
# AWS settings
#--------------------------------------------------------------
variable "access_key" {
    description = "Please enter your AWS access key"
}

variable "secret_key" {
    description = "Please enter your AWS secret key"
}

variable "vpc_name" {
    description = "Please enter your VPC name"
    default = "demo"
}

variable "vpc_region" {
    description = "Please enter your AWS region"
    default = "eu-west-1"
}
