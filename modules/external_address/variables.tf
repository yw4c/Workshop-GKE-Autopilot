variable "name" {
  description = "name of compute address"
  type        = string
}

variable "region" {
  description = "Region where the resources will be created."
  type        = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}