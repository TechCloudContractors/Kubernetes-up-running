provider "google" {
  region = var.region
  project = var.project_id
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
  version                    = "22.0.0"
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  zones                      = var.zones
  network                    = var.network_name
  istio = true
  subnetwork                 = "${var.region}-01"
  ip_range_pods              = "pods-ip-range"
  ip_range_services          = "services-ip-range"
  http_load_balancing        = true
  network_policy             = true
  disable_legacy_metadata_endpoints = true
  horizontal_pod_autoscaling = true
  enable_private_endpoint    = true
  enable_private_nodes       = true
  master_ipv4_cidr_block     = "10.0.0.0/28"
  remove_default_node_pool = true
  initial_node_count = 1
  master_authorized_networks = var.master_authorized_networks
}

resource "google_container_node_pool" "node_pool" {
  name     = "private-pool"
  project  = var.project_id
  location = var.region
  cluster  = module.gke.name

  initial_node_count = "1"

  autoscaling {
    min_node_count = "1"
    max_node_count = "5"
  }

  management {
    auto_repair  = "false"
    auto_upgrade = "true"
  }

  node_config {
    image_type   = "COS_CONTAINERD"
    machine_type = "e2-small"

    labels = {
      private-pools-example = "true"
    }

    # tags = [
    #   module.vpc_network.private,
    #   "private-pool-example",
    # ]

    disk_size_gb = "30"
    disk_type    = "pd-standard"
    preemptible  = false

    service_account = module.gke.service_account

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  lifecycle {
    ignore_changes = [initial_node_count]
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}