terraform {
  required_providers {
    google = {
      source    = "hashicorp/google"
      version   = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project     = "bionic-flux-414109"
region      = "us-central1"
zone        ="us-central1-a"
credentials = "bionic-flux-414109-6a39dd7bbe43.json"

}

resource "google_storage_bucket" "dn3-bucket-1" {
  name          = "dn3_for_real"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}