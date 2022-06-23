##################### GENERAL ####################

variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
}



variable "region" {
  description = "The region the cluster in"
  default     = "us-central1"
  type        = string
}

variable "cluster_type" {
  type        = string
  description = "GKE Autopilot"
}

variable "release_channel" {
  type        = string
  description = "Release channel name"
  default     = "REGULAR"
}

##################### VPC ##########################

variable "network_name" {
  type        = string
  description = "VPC Name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet Name"
}

variable "master_auth_subnetwork" {
  type        = string
  description = "Master Auth Subnetwork"
}

variable "pods_range_name" {
  type        = string
  description = "pod range"
}

variable "svc_range_name" {
  type        = string
  description = "service range"
}
variable "subnet_ip_worker_nodes" {
  type        = string
  description = "Subent IP range for worker nodes"

}
variable "subnet_ip_master_auth" {
  type        = string
  description = "Master Auth IP range allow subnet"

}

variable "pod_ip_range" {
  type        = string
  description = "pod ip range"

}
variable "svc_ip_range" {
  type        = string
  description = "svc ip range"

}

########## SQL #####################
# Note, after a name db instance is used, it cannot be reused for up to one week.
variable "name_prefix" {
  description = "The name prefix for the database instance. Will be appended with a random string. Use lowercase letters, numbers, and hyphens. Start with a letter."
  type        = string
}

variable "master_user_name" {
  description = "The username part for the default user credentials, i.e. 'master_user_name'@'master_user_host' IDENTIFIED BY 'master_user_password'. This should typically be set as the environment variable TF_VAR_master_user_name so you don't check it into source control."
  type        = string
}

variable "master_user_password" {
  description = "The password part for the default user credentials, i.e. 'master_user_name'@'master_user_host' IDENTIFIED BY 'master_user_password'. This should typically be set as the environment variable TF_VAR_master_user_password so you don't check it into source control."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# Generally, these values won't need to be changed.
# ---------------------------------------------------------------------------------------------------------------------

variable "postgres_version" {
  description = "The engine version of the database, e.g. `POSTGRES_9_6`. See https://cloud.google.com/sql/docs/features for supported versions."
  type        = string
  default     = "POSTGRES_11"
}

variable "machine_type" {
  description = "The machine type to use, see https://cloud.google.com/sql/pricing for more details"
  type        = string
  default     = "db-f1-micro"
}

variable "db_name" {
  description = "Name for the db"
  type        = string
  default     = "default"
}

variable "name_override" {
  description = "You may optionally override the name_prefix + random string by specifying an override"
  type        = bool
  default     = false
}

# When configuring a public IP instance, you should only allow secure connections
# For testing purposes, we're initially allowing unsecured connections.
variable "require_ssl" {
  description = "True if the instance should require SSL/TLS for users connecting over IP. Note: SSL/TLS is needed to provide security when you connect to Cloud SQL using IP addresses. If you are connecting to your instance only by using the Cloud SQL Proxy or the Java Socket Library, you do not need to configure your instance to use SSL/TLS."
  type        = bool
  default     = false
}

variable "master_zone" {
  description = "Master node zone"
  type        = string
}


variable "disk_autoresize" {
  description = "Configuration to increase storage size."
  type        = bool
  default     = true
}

variable "disk_autoresize_limit" {
  description = "The maximum size to which storage can be auto increased."
  type        = number
  default     = 0
}

variable "disk_size" {
  description = "The disk size for the master instance."
  default     = 100
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  type        = string
  default     = "PER_USE"
}