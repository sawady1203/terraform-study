variable "org_id" {
  type        = string
  description = "Organization ID"
}

variable "billing_account" {
  type        = string
  description = "Billing Account ID"
}

variable "bootstrap_project" {
  type        = string
  description = "Terraform Admin Project"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID to be created"
}
