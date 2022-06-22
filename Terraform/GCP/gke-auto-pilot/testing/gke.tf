
module "gke-autopilot" {
source = "../"
project_id                = "some-projct-id"
region                    = "us-central1"
cluster_type              = "gke-t2-public"
release_channel           = "REGULAR"
subnet_ip_worker_nodes = "10.0.0.0/17"
subnet_ip_master_auth  = "10.60.0.0/17"
pod_ip_range           = "192.168.0.0/18"
svc_ip_range           = "192.168.64.0/18"
network_name           = "gke-test-vpc"
subnet_name            = "gke-autopilot-usc1-subnet"
master_auth_subnetwork = "gke-master-auth-usc1-subnet"
pods_range_name        = "gke-pod-range-01"
svc_range_name         = "gke-svc-range-01"

}