resource "google_compute_router" "my-router-01" {
  name    = "my-router-01"
  region  = var.region
  network = "projects/${var.project_id}/global/networks/default"
}

resource "google_compute_router_nat" "router-nat-01" {
  name                               = "router-nat-01"
  router                             = google_compute_router.my-router-01.name
  region                             = google_compute_router.my-router-01.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}