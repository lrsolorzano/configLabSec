# Terraform Variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "instance_types" {
  description = "List of GCP instance types"
  type        = list(string)
}

variable "network_configuration" {
  description = "Network configuration for the GCP instance"
  type        = map(string)
}
