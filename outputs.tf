output "vpc_id" {
    value = "${aws_vpc.main.id}"
}

output "vpc_subnet1a" {
    value = "${aws_subnet.Subnet1a.id}"
}

output "vpc_subnet1b" {
    value = "${aws_subnet.Subnet1b.id}"
}

output "vpc_subnet1c" {
    value = "${aws_subnet.Subnet1c.id}"
}
