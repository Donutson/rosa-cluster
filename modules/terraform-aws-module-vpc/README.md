# AWS VPC Terraform module

## Description

Terraform module which creates VPC resources on AWS. In particular it creates subnets, an internet gateway, a route table, a route table association, a security group with rules that enables ssh, https and http traffic from any source.

## Usage
```
module "vpc" {
  source      = "../"
  cidr_blocks = "10.0.0.0/16"
  subnets     = {
    "sub" = {
      cidr                    = "10.0.1.0/24"
      az                      = "us-east-1a"
      name                    = "sub"
      map_public_ip_on_launch = "true"
    }
  }
  tags        = {
    vpc              = "VPC"
    internet_gateway = "DummyGateway"
    nat_gateway_pub  = "PubRouteTable"
    eip_nat_gateway  = "AwsEip"
    nat_gateway_priv = "PrivNatGateway"
    nat_gateway_rt   = "PubRouteTableRt"
    security_group   = "SGWorker"
  }
}
```

### Subnets
By default this module create one subnet and map it with a public ip at launch. To have more subnets just add them in the subnets arg and specify their map_public_ip_on_launch attribute to false if you don't to map them an ip at launch

## Contributing
Report issues/questions/feature requests on in the [issues](https://gitlab.beopenit.com/beopenit-data/odh-project/terraform-projects/odh-project/issues/new) section.

## Requirements

|     Name   |   Version                                               |
|------------|:-------------------------------------------------------:|
| terraform  | >= [1.0](https://www.terraform.io/downloads.html)       |
| aws        | >= 3.0                                                  |

## Modules

No modules

## Resources

|     Name                                                                                                                           |   Type         |
|------------------------------------------------------------------------------------------------------------------------------------|:--------------:|
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                         | resource       |
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                   | resource       |
| [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)               | resource       |
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                         | resource       |
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource       |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                   | resource       |
| [aws_security_group_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)         | resource       |

## Inputs

|     Name    |      Description       |     Type     |        Default                    | Required |
|-------------|:-----------------------|:------------:|:---------------------------------:| :-------:|
| cidr_blocks | The vpc cidr blocks    | ``string``   | ``"10.0.0.0/16"``                 | No       |
| subnets     | subnets inside the vpc | ``map(any)`` | [see here](examples/variables.tf) | No       |
| tags        | the resources tags     | ``map(any)`` | [see here](examples/variables.tf) | No       |

## Outputs

| Name              | Description                                                               |
|-------------------|---------------------------------------------------------------------------|
| vpc_id            | The vpc id                                                                |
| subnet_id         | The unique subnet  id, the first subnet if there is more than one subnet  |
| security_group_id | The security group id                                                     |

## Authors

Module is maintained by BeOpenIT BU DATA-AI-ML

## License

BeOpenIT Licensed
