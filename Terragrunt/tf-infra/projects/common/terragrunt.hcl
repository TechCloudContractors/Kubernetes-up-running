dependency "infra" {
  config_path = "${get_terragrunt_dir()}/../../bootstrap"
}

remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = dependency.infra.outputs.bucket_name
    prefix = "core-infrastructure/common/${path_relative_to_include()}"
    project  = "cantech-terraform"
    location = "northamerica-northeast1"
  }
}

# generate "provider" {
#   path      = "provider.tf"
#   if_exists = "overwrite"
#   contents  = <<EOF
# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = ">= 3.56.0"
#     }
#   }
# }

# provider "google" {
#   region = "northamerica-northeast1"
#   # credentials = path or contents of SA JSON file
# }
# EOF
# }