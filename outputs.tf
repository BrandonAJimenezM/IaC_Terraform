output "ip_publica_vm" {
  value       = google_compute_instance.my_instance.network_interface[0].access_config[0].nat_ip
  description = "La IP pública asignada a la VM en GCP"
}

output "vm_info" {
  value = {
    nombre = google_compute_instance.my_instance.name
    ip     = google_compute_instance.my_instance.network_interface[0].access_config[0].nat_ip
  }
  description = "name e ip"
}