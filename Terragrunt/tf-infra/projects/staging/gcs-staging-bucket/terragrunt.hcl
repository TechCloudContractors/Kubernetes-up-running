locals {
  config = yamldecode(file("${get_terragrunt_dir()}/../../../config/staging-core-inputs.yaml"))
}
inputs = {
  vpc_name               = local.config.vpc_name
  project_id             = local.config.project_id
  target_service_account = local.config.target_service_account
  region                 = local.config.region
  env                    = local.config.environment
}



terraform {
    source = "${get_terragrunt_dir()}/../../../modules//gcs"
}


remote_state {
  backend = "gcs"
    generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket   = "${local.config.project_id}-tf"
    prefix   = "project/staging/${path_relative_to_include()}"
    project  = "${local.config.project_id}"
    location = "${local.config.region}"
  }
}