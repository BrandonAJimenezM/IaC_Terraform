variable "project" {}
variable "credentials_file" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "os_image" {
  default     = "debian-cloud/debian-12"
  description = "This is a description from the end user's perspective"
  type        = string
}

variable "vm_params" {
  type = object({
    name                      = string
    machine_type              = string
    zone                      = string
    allow_stopping_for_update = bool
  })
  description = "vm parameters"
  default = {
    name                      = "terraform-instance"
    machine_type              = "e2-micro"
    zone                      = "us-central1-a"
    allow_stopping_for_update = true
  }

  validation {
    condition     = length(var.vm_params.name) > 3
    error_message = "VM name must be at least 4 characters."
  }

}

variable "my_map" {
  type        = map(string)
  description = "GCP provider params"
  default = {
    project     = "myprojectname"
    credentials = "cred.json"
    region      = "us-central1"
  }
}