provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source      = "../"
  tags        = var.tags
  cidr_blocks = var.cidr_blocks
  subnets     = var.subnets
}
