output "vpc_id" {
  value       = aws_vpc.main.id
  description = "vpc identifiant"
}


output "subnet_id" {
  value       = aws_subnet.subnets["sub"].id
  description = "sudnet identifiant"
}


output "security_group_id" {
  value       = aws_security_group.sg_worker.id
  description = "security group identifiant"
}