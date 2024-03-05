terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.15.1"
    }
  }
}

provider "mongodbatlas" {
}

resource "mongodbatlas_advanced_cluster" "test" {
  project_id   = var.atlas_project_ID
  name         = "???"
  cluster_type = "REPLICASET"

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = "M0"
      }
      provider_name         = "TENANT"
      backing_provider_name = var.backing_provider_name
      region_name           = "US_EAST_1"
      priority              = 7
    }
  }
}



 resource "mongodbatlas_database_user" "user1" {
  username           = "???"
  password           = var.password
  project_id         = var.atlas_project_ID
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
 }
