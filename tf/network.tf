resource "google_compute_global_address" "api-ip" {
  name = "global-api-ip"
  ip_version = "IPV4"
}

resource "google_compute_global_address" "api-ip-6" {
  name = "global-api-ip-6"
    ip_version = "IPV6"
}

resource "google_compute_network" "util-vpc" {
  name                    = "example-vpc"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "util-firewall" {
  name    = "example-firewall"
  network = "${google_compute_network.util-vpc.name}"

  allow {
    protocol = "all"
  }
}