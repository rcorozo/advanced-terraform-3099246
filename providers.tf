terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.50.0"
    }
  }
}


provider "google" {
  project = "advancedterraform-375912" #replace this with your project-id
  region  = "us-central1"
  zone    = "us-central1-a"
}