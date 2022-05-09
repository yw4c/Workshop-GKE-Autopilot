module "my_cluster_01" {
  source = "../modules/gke_autopilot"

  project_id = var.project_id
  region     = var.region
  name       = var.cluster_name
  network    = "projects/${var.project_id}/global/networks/default"
  subnetwork = "projects/${var.project_id}/regions/${var.region}/subnetworks/default"
}