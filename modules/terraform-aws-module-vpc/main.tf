resource "aws_vpc" "main" {
  cidr_block = var.cidr_blocks

  tags = {
    Name = var.tags["vpc"]
  }
}


//SUBNETS 
resource "aws_subnet" "subnets" {
  for_each                = var.subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    Name = each.value.name
  }
}


//INTERNET GATEWAY
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = var.tags["internet_gateway"]
  }
}


resource "aws_route_table" "nat_gateway" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    "Name" = var.tags["nat_gateway_pub"]
  }
}

resource "aws_route_table_association" "rta_sub" {
  subnet_id      = aws_subnet.subnets["sub"].id
  route_table_id = aws_route_table.nat_gateway.id
}


resource "aws_security_group" "sg_worker" {
  vpc_id      = aws_vpc.main.id
  description = "Allow inbound traffic to ec2 instance"

  #Avoid circular dependencies stopping the destruction of the cluster 
  revoke_rules_on_delete = true

  tags = {
    Name = var.tags["security_group"]
  }
}


# Allow https access
resource "aws_security_group_rule" "https_access" {
  type              = "ingress"
  description       = "Allow inbound https access"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_worker.id
}


# Allow SSH traffic 
resource "aws_security_group_rule" "ssh_access" {
  type              = "ingress"
  description       = "Allow inbound ssh access to worker"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_worker.id
}


# Allow http traffic 
resource "aws_security_group_rule" "hhtp_access" {
  type              = "ingress"
  description       = "Allow inbound http access to worker"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_worker.id
}


# Allow all egress traffic
resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  description       = "Allow all egress traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_worker.id
}
