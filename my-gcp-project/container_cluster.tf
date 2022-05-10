module "my_cluster_01" {
  source = "../modules/gke_autopilot"

  project_id = var.project_id
  region     = var.region
  name       = "my-cluster-01"
  network    = "projects/${var.project_id}/global/networks/default"
  subnetwork = "projects/${var.project_id}/regions/${var.region}/subnetworks/default"

  master_authorized_networks = var.master_authorized_networks
}