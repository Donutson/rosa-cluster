################# Secrets #########################
variable "AWS_KEY_ID" {
  type        = string
  description = "Aws access key from env variable "
}


variable "AWS_SECRET_KEY" {
  type        = string
  description = "Aws secret key from env variable "
}


variable "REDHAT_TOKEN" {
  type        = string
  description = "Redhat token"
}
################# Secrets #########################


################# EC2 #########################
variable "ec2" {
  type        = any
  description = "our ec2 instance info"

  default = {
    ami  = "ami-02e136e904f3da870"
    type = "t2.micro"

    connection = {
      type = "ssh"
      user = "ec2-user"
    }
  }
}
################# EC2 #########################


################# Openshit cluster #########################
variable "cluster_name" {
  type        = string
  description = "Openshift cluster name"
  default     = "openshift-test"
}


variable "cluster_region" {
  type        = string
  description = "Openshift cluster region"
  default     = "eu-west-1"
}


variable "cluster_compute_nodes" {
  type        = number
  description = "Number of compute nodes"
  default     = 3
}


variable "cluster_compute_machine_type" {
  type = string
  description = "worker nodes instance type"
  default = "m5.2xlarge"
}


variable "cluster_machine_cidr" {
  type        = string
  description = "Cluster machine cidr block"
  default     = "10.0.0.0/16"
}


variable "cluster_service_cidr" {
  type        = string
  description = "Cluster service cidr block"
  default     = "172.30.0.0/16"
}


variable "cluster_pod_cidr" {
  type        = string
  description = "Cluster pod cidr block"
  default     = "10.128.0.0/14"
}


variable "cluster_host_prefix" {
  type        = number
  description = "Cluster host prefix"
  default     = 23
}


variable "openshift_version" {
  type        = string
  description = "Openshift version to install"
  default     = "4.8.13"
}
################# Openshit cluster #########################


################# Tags #########################
variable "tags" {
  type        = map(any)
  description = "Define tags"
  default = {
    Application   = "rosa"
    Environment = "test"
  }
}
################# Tags #########################


################# key #########################
variable "ssh_key_path" {
  type        = string
  description = "ssh key to access ec2 instance"
  default     = "./keys/id_rsa"
}
################# key #########################


################# terraform #########################
variable "aws_region" {
  type        = string
  description = "AWS region to deploy infra"
  default     = "us-east-1"
}
################# terraform #########################
