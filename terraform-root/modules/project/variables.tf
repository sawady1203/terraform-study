variable "project_name" {
  type        = string
  description = "Display name of the project"
}

variable "project_id" {
  type        = string
  description = "Unique GCP project ID"
}

variable "folder_id" {
  type        = string
  description = "ID of the folder to attach the project to"
}

variable "billing_account" {
  type        = string
  description = "Billing account ID"
}

variable "org_id" {
  type        = string
  description = "GCP organization ID"
}
