variable "folder_name" {
  type        = string
  description = "Name of the folder to create"
}

variable "parent" {
  type        = string
  description = "ID of the parent resource (organization or folder)"
}
