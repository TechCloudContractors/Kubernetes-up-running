# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "gcs" {
    bucket = "cantech-terraform-tf"
    prefix = "project/staging/."
  }
}