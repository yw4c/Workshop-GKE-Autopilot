variable "project_id" {
  description = "The ID of the project where the GKE will be created."
  type        = string
}

variable "region" {
  description = "Region where the resources will be created."
  type        = string
}

variable "name" {
  description = "name of cluster"
  type        = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}


######### Network #########

variable "ip_allocation_policy" {
  type    = bool
  default = true
}

variable "cluster_ipv4_cidr_block" {
  type    = string
  // Set to blank to have a range chosen with the default size.
  default = null
}

variable "services_ipv4_cidr_block" {
  type    = string
  // Set to blank to have a range chosen with the default size.
  default = null
}

variable "master_authorized_networks" {
  type = list(object({ cidr_block = string, display_name = string }))
  default = [
    {
      display_name = "Internal Pod"
      cidr_block   = "10.101.0.0/20"
    }
  ]
}

variable "enable_private_endpoint" {
  type    = bool
  default = false
}

variable "enable_private_cluster" {
  type        = bool
  description = "Enable private cluster"
  default     = true
}

variable "master_ipv4_cidr_block" {
  type    = string
  default = "192.168.20.48/28"
}

