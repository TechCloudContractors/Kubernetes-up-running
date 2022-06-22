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
