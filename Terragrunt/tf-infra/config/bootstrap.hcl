remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "fvkvkjbnkkdntest"
    prefix = "core-infrastructure/bootstrap"
    project  = "cantech-terraform"
    location = "northamerica-northeast1"
  }
}
