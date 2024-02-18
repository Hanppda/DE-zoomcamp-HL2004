terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.15.0"
    }
  }
}

provider "google" {
  project = "lively-wave-413709"
  region  = "australia-southeast2"
  credentials = file(var.credentials)
}

resource "google_storage_bucket" "demobucket" {
  name          = "decamp-demo-bucket-413709"
  location      = var.Location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = var.dataset_name
  friendly_name               = "test"
  description                 = "This is a demo dataset"
  location                    = "US"
  
}