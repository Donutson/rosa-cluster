
variable "cidr_blocks" {
  type = string
  description = "The vpc cidr blocks"
  default     = "10.0.0.0/16"
}


variable "tags" {
  type        = map(any)
  description = "the resources tags"
  default = {
    vpc              = "VPC"
    internet_gateway = "DummyGateway"
    nat_gateway_pub  = "PubRouteTable"
    eip_nat_gateway  = "AwsEip"
    nat_gateway_priv = "PrivNatGateway"
    nat_gateway_rt   = "PubRouteTableRt"
    security_group   = "SGWorker"
  }
}


variable "subnets" {
  type = map(any)
  description = "subnets inside the vpc"
  default = {
    "sub" = {
      cidr                    = "10.0.1.0/24"
      az                      = "us-east-1a"
      name                    = "sub"
      map_public_ip_on_launch = "true"
    }
  }
}
