locals {
  cluster_type           = var.cluster_type
  network_name           = var.network_name
  subnet_name            = var.subnet_name
  master_auth_subnetwork = var.master_auth_subnetwork
  pods_range_name        = var.pods_range_name
  svc_range_name         = var.svc_range_name
  subnet_names           = [for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]]
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  project_id                      = var.project_id
  name                            = "${local.cluster_type}-cluster"
  regional                        = true  # gke autopilot is regional cluster
  region                          = var.region
  network                         = module.gcp-network.network_name
  subnetwork                      = local.subnet_names[index(module.gcp-network.subnets_names, local.subnet_name)]
  ip_range_pods                   = local.pods_range_name
  ip_range_services               = local.svc_range_name
  release_channel                 = var.release_channel
  datapath_provider               = "ADVANCED_DATAPATH"
  enable_vertical_pod_autoscaling = true
}