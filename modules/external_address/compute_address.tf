resource "google_compute_address" "external_address" {
  name         = var.name
  address_type = "EXTERNAL"
  region       = var.region
}