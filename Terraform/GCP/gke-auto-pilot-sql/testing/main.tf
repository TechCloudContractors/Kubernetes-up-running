
module "gke-autopilot-sql" {
source = "../"
project_id                = "gcp-project"
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

#DB Postgres
name_prefix            = "test-t5-postgres"  # We cannot use the same name in GCP for 1 week if you delete it
db_name                = "test-db"
machine_type           = "db-custom-1-3840"
postgres_version       = "POSTGRES_14"
master_zone            = "us-central1-c"
name_override          = true #  name_prefix + random string
require_ssl            = false
master_user_name       = "admin_user"  # Recommended to use enviornment variable export TF_VAR_master_user_name=xxxxxxxx
master_user_password   = "AdminString#123" # Recommended to use enviornment variable export TF_VAR_master_user_password=xxxxxxxxx
disk_autoresize        = false
disk_autoresize_limit  = 0
disk_size              = 100
disk_type              = "PD_SSD"
pricing_plan           = "PER_USE"
}
