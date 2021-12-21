# BeOpenIT-Documentation Openshift cluster Deployment
## Description

This module aims to create an Openshift cluster using Redhat Openshift Service on AWS (ROSA)

## Requirements

- AWS CLI (recommended for best practices), see [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) to install AWS CLI
- Terraform version 1.1.0, see [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) to install terraform
- One AWS account , see [here](https://aws.amazon.com/fr/premiumsupport/knowledge-center/create-and-activate-aws-account/) to create an AWS account.
- One RedHat Openshift account, see [here](https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/registrations?client_id=https%3A%2F%2Fwww.redhat.com%2Fwapps%2Fugc-oidc&redirect_uri=https%3A%2F%2Fwww.redhat.com%2Fwapps%2Fugc%2Fprotected%2Faccount.html&response_type=code&scope=openid) to create an RedHat Openshift account.
- Subscription to ROSA on AWS, see [here](https://aws.amazon.com/fr/rosa/) for more informations.

## Usage 
```hcl
module "rosa" {
  source         = "../"
  AWS_KEY_ID     = var.AWS_KEY_ID
  AWS_SECRET_KEY = var.AWS_SECRET_KEY
  REDHAT_TOKEN   = var.REDHAT_TOKEN
}
```
Go [here](example/variables.tf) for an example

## Module
This module use an internal module called terraform-aws-module-vpc that provision a vpc with one EC2 instance, the EC2 instance use [ROSA](https://aws.amazon.com/fr/rosa/) to create an openshift cluster in your Redhat account.

## Resources 
| Name | Type | 
|-------------|-----------------------|
|[aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/Instance)| resource |
|[aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)| resource |
|[file](https://www.terraform.io/docs/language/resources/provisioners/file.html) | provisioner |
|[remote-exec](https://www.terraform.io/docs/language/resources/provisioners/remote-exec.html) | provisioner |
|[aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
|[aws_iam_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
|[aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
|[aws_iam_user_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs
| Name        | Description           | Type | Default | Required |
|-------------|-----------------------|------|---------|----------|
|AWS_KEY_ID   | Aws access key from env variable | ``string`` | | yes |
|AWS_SECRET_KEY | Aws secret key from env variable | ``string`` | | yes |
|REDHAT_TOKEN | Redhat token | ``string`` | | yes |
|ec2 | Configure EC2 instance | ``any`` | [See here](./variables.tf) | no |
|cluster_name | Openshift cluster name | ``string`` | "openshift-test" | no |
|cluster_region | Openshift cluster region | ``string`` | "eu-west-1" | no |
|cluster_compute_nodes | Number of compute nodes | ``number`` | 3 | no |
|cluster_compute_machine_type | worker nodes instance type" | ``string`` | "m5.2xlarge" | no |
|cluster_machine_cidr | Cluster machine cidr block | ``string`` | "10.0.0.0/16" | no |
|cluster_service_cidr | Cluster service cidr block | ``string`` | "172.30.0.0/16" | no |
|cluster_pod_cidr | Cluster pod cidr block | ``string`` | "10.128.0.0/14" | no |
|cluster_host_prefix | Cluster host prefix | ``number`` | 23 | no |
|openshift_version | Openshift version to install | ``string`` | "4.8.13" | no |
|tags | resources tags | ``map(any)`` | [See here](./variables.tf) | no |
|ssh_key_path | ssh key to access ec2 instance | ``string`` | "./keys/id_rsa" | no |
|aws_region | AWS region to deploy infra | ``string`` | "us-east-1" | no |

## Outputs
| Name         | Description           |
|--------------|-----------------------|
|ec2_public_ip | EC2 PUBLIC IP         |


## Dependencies
This module has no externals dependencies yet

## Authors
Module is maintained by BeOpenIT BU DATA 

## License
BeOpenIT Licensed