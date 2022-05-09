provider "google" {
  credentials = file(var.credential_json)
  project = var.project_id
  region  = var.region
}

# Beta feature
provider "google-beta" {
  credentials = file(var.credential_json)
  project = var.project_id
  region  = var.region
}

terraform {
  required_providers {
    google-beta = {
      # https://registry.terraform.io/providers/hashicorp/google-beta/latest
      version = "~>4.20.0"
    }
  }
}
