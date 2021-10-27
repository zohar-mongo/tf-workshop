terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.0.2"
    }
  }
}

provider "mongodbatlas" {
}

resource "mongodbatlas_cluster" "cluster" {
  project_id   = var.atlas_project_ID
  provider_name = var.provider_name
  name = "???"
  backing_provider_name = var.backing_provider_name
  provider_region_name = "US_EAST_1"
  provider_instance_size_name = "M0"
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
