output "ip" { value = "${ aws_instance.bastion.public_ip }" }
output "security-group-id" { value = "${ aws_security_group.bastion.id }" }