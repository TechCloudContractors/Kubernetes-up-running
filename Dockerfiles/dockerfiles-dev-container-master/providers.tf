locals {
  tf_sa = var.terraform_service_account

}
provider "google"{
  credentials = file(var.ci_cred_file)
  alias = "impersonate"

  scopes = [
  "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

data "google_service_account_access_token" "default"{
  provider = google.impersonate
  target_service_account = local.tf_sa
  scopes = ["userinfo-email","cloud-platform"]
  lifetime = "600s"
}

provider "google" {
  project = var.project_id
  access_token = data.google_service_account_access_token.default.access_token
}

provider "google-beta" {
  project = var.project_id
  access_token = data.google_service_account_access_token.default.access_token
}