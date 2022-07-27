terraform {
  required_providers {
    google = {
      version = ">= 2.7.0"
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  alias = "impersonate"

  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}
data "google_service_account_access_token" "default" {
  provider               = google.impersonate
  target_service_account = var.target_service_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "600s"
}

provider "google" {
  project      = var.project_id
  region       = var.region
  access_token = data.google_service_account_access_token.default.access_token
}

provider "google-beta" {
  project      = var.project_id
  region       = var.region
  access_token = data.google_service_account_access_token.default.access_token
}