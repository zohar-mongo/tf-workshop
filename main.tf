terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "0.9.0"
    }
  }
}

provider "mongodbatlas" {
}

resource "mongodbatlas_cluster" "cluster" {
  project_id   = var.atlas_project_ID
  provider_name               = var.provider_name
  name         = "???"
  provider_instance_size_name = "M10"
  mongo_db_major_version       = "4.2"
  disk_size_gb                = 100
  provider_region_name        = "US_EAST_1"
  auto_scaling_disk_gb_enabled = true
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
