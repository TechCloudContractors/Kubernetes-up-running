locals {
  tf_sa = "tf-prod-sa@gcp-project.iam.gserviceaccount.com" #service acount with permissions
}

provider "google" {
  alias = "impersonte"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email"
  ]
}

data "google_service_account_access_token" "default" {
  provider               = google.impersonte
  target_service_account = local.tf_sa
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "3600s"

}

provider "google" {
  access_token = data.google_service_account_access_token.default.access_token
  region  = "us-central1"
}
provider "google-beta" {
  access_token = data.google_service_account_access_token.default.access_token
  region  = "us-central1"
}