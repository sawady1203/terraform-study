variable "constraint" {
  type        = string
  description = "Constraint to apply (e.g., constraints/iam.disableServiceAccountCreation)"
}

variable "parent" {
  type        = string
  description = "Target resource (organizations/ORG_ID or folders/FOLDER_ID)"
}

variable "enforced" {
  type        = bool
  description = "Whether to enforce the constraint"
}

variable "org_id" {
  type        = string
  description = "GCP organization ID"
  
}