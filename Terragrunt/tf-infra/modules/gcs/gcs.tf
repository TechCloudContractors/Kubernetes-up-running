resource "google_storage_bucket" "tfstate-bucket" {
  name          = "tfstate-${var.env}-bucket"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
  labels = { app = var.env }

}