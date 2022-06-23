### Notes for GKE Autopilot Module

### This Module creates following resource types

1. GKE
2. IAM /Service accounts
3. Networking like VPC


### API Enabled in GCP Project

Make sure following apis GCP project (Some time these APis are enabled by default)
1. Compute Engine API
2. Cloud Monitoring API	
3. Cloud Logging API	
4. Cloud Resource Manager API		
5. Kubernetes Engine API	
6. Identity and Access Management (IAM) 
7. IAM Service Account Credentials API	
8. Cloud Identity-Aware Proxy API
9. Service Management API					
10. Service Networking API					
11. Service Usage API
12. Cloud SQL Admin API
13. Cloud SQL

#### IAM Roles for Service Account

Mostly we are going to use service account to deploy resources

These are the IAM roles required for service account
1. Compute Admin
2. Compute Image User
3. Compute Network Admin
4. Kubernetes Engine Admin
5. Security Admin
6. Service Account User
7. Storage Admin
8. Cloud SQL Admin

#### [Optional] In testing folder we have impersonation sample example, you are feel free to use your existing method to run terraform code
```bash
gcloud auth application-default login --no-launch-browser

gcloud auth list
(you should see your identity)
```

#### Example Usage of this module
```bash
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

    name_prefix            = "test-t5-postgres"  # We cannot use the same name in GCP for 1 week if you delete database instance
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
```