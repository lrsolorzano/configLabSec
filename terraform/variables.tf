// Terraform variables for GCP configuration

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the GCP resources."
  type        = string
}

variable "zone" {
  description = "The zone for the GCP resources."
  type        = string
}

variable "network_name" {
  description = "The name of the GCP network."
  type        = string
}

variable "subnetwork_name" {
  description = "The name of the GCP subnetwork."
  type        = string
}

variable "instance_type" {
  description = "The instance type for GCP VM instances."
  type        = string
}

variable "machine_image" {
  description = "The machine image to use for instances."
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account."
  type        = string
}