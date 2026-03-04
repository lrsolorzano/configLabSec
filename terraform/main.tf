# GCP Provider Configuration

provider "google" {
  credentials = file("<YOUR-CREDENTIALS-FILE>.json")
  project     = var.project_id
  region      = var.region
}