provider "google" {
  project = "terraform-practice-book"
  region  = "asia-northeast1"
}

variable "compute_instance_zone" {
  description = "The zone to deploy the compute instance"
  type        = string
  default     = "asia-northeast1-a"

  validation {
    condition     = contains(["asia-northeast1-a", "asia-northeast1-b", "asia-northeast1-c"], var.compute_instance_zone)
    error_message = "The zone must be one of the following: asia-northeast1-a, asia-northeast1-b, asia-northeast1-c"
  }
  
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = var.compute_instance_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  } 
}

output "instance_name" {
  value = google_compute_instance.default.name
}
output "instance_zone" {
  value = google_compute_instance.default.zone
}
output "instance_id" {
  value = google_compute_instance.default.id
}