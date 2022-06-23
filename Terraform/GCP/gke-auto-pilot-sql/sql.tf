module "pg" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "11.0.0"
  name                 = var.name_prefix
  random_instance_name = true
  project_id           = var.project_id
  database_version     = var.postgres_version
  region               = var.region

  // Master configurations
  tier                            = var.machine_type
  zone                            = var.master_zone
  availability_type               = "REGIONAL"
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"

  deletion_protection = false

  database_flags = [{ name = "autovacuum", value = "off" }]

  user_labels = {
    env = "postgres-public-node"
  }

  ip_configuration = {
    ipv4_enabled       = true
    require_ssl        = var.require_ssl
    private_network    = null
    allocated_ip_range = null
    authorized_networks = [
        {
        name  = "allow-all-inbound"
        value = "0.0.0.0/0"
        },
    ]
  }


  db_name      = var.db_name
  db_charset   = "UTF8"
  db_collation = "en_US.UTF8"

  user_name     = var.master_user_name
  user_password = var.master_user_password
  disk_autoresize = var.disk_autoresize
  disk_autoresize_limit = var.disk_autoresize_limit
  disk_size = var.disk_size
  disk_type = var.disk_type
  pricing_plan = var.pricing_plan

}