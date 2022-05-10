# container_cluster arguments : https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster

resource "google_container_cluster" "primary" {

  provider = google-beta
  name     = var.name
  project  = var.project_id
  location = var.region

  enable_autopilot = true

  dynamic "private_cluster_config" {
    for_each = var.enable_private_cluster ? tolist([1]) : []
    content {
      enable_private_endpoint = var.enable_private_endpoint
      enable_private_nodes    = var.master_ipv4_cidr_block != null ? true : false
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = var.master_authorized_networks == null ? [] : tolist([1])
    content {
      dynamic "cidr_blocks" {
        for_each = var.master_authorized_networks
        content {
          cidr_block   = cidr_blocks.value["cidr_block"]
          display_name = cidr_blocks.value["display_name"]
        }
      }
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "02:00"
    }
  }

  pod_security_policy_config {
    enabled = true
  }

  // networking_mode VPC_NATIVE: Use VPC network. refer https://cloud.google.com/kubernetes-engine/docs/concepts/alias-ips#benefits
  networking_mode = "VPC_NATIVE"
  // ip_allocation_policy: Set CIDR for VPC_NATIVE
  dynamic "ip_allocation_policy" {
    for_each = var.ip_allocation_policy == true ? tolist([1]) : []
    content {
      cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
      services_ipv4_cidr_block = var.services_ipv4_cidr_block
    }
  }

}