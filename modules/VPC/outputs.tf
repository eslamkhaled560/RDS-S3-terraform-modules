output "rds_subnet_az1_id" {
  value = aws_subnet.subnet_az1.id
}

output "rds_subnet_az2_id" {
  value = aws_subnet.subnet_az2.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds_security_group.id
}