output "bucket_name" {
  description = "Bucket name (for single use)."
  value       = google_storage_bucket.tfstate-bucket.name
}