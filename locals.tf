locals {
  scripts = split("\r", templatefile("${path.module}/scripts/cluster-deploy.sh", { access_key = var.AWS_KEY_ID,
    secret_key  = var.AWS_SECRET_KEY,
    redhatToken = var.REDHAT_TOKEN,
    clusterName = var.cluster_name,
    region      = var.cluster_region,
    computeNode = var.cluster_compute_nodes,
    version     = var.openshift_version,
    machineCIDR = var.cluster_machine_cidr,
    serviceCIDR = var.cluster_service_cidr,
    podCIDR     = var.cluster_pod_cidr,
    hostPrefix  = var.cluster_host_prefix,
    computeMachineType = var.cluster_compute_machine_type
    })
  )
}