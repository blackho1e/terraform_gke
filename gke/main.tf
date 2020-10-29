terraform {
  required_version = ">= 0.12.7"
}

data "google_container_engine_versions" "location" {
  location = var.zone
  project  = var.google_project_id
}

locals {
  latest_version     = data.google_container_engine_versions.location.latest_master_version
  kubernetes_version = var.kubernetes_version != "latest" ? var.kubernetes_version : local.latest_version
}

resource "google_container_cluster" "default" {
  name               = var.cluster_name
  location           = var.zone
  initial_node_count = var.initial_node_count
  min_master_version = local.kubernetes_version
  network            = var.network
  subnetwork         = var.subnetwork
  enable_legacy_abac = true

  maintenance_policy {
    daily_maintenance_window {
      start_time = "02:00"
    }
  }
  
  node_config {
    machine_type = var.machine_type
  }

  provisioner "local-exec" {
    when    = destroy
    command = "sleep 90"
  }
}

