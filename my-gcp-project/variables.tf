variable "project_id" {
  type    = string
  default = "experiment-348917"
}

variable "credential_json" {
  type    = string
  default = "../credentials/experiment-348917-7eec1fb9c4cc.json"
}

variable "master_authorized_networks" {
  type = list(object({ cidr_block = string, display_name = string }))
  default = [
    {
      display_name = "Change me"
      cidr_block   = "0.0.0.0/0"
    }
  ]
}

variable "region" {
  type    = string
  default = "us-central1"
}
