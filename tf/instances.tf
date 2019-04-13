resource "google_compute_instance_template" "default" {
  name        = "appserver-template"
  description = "This template is used to create app server instances."

  machine_type         =  "f1-micro"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "debian-cloud/debian-9"
    auto_delete  = true
    boot         = true
  }
  
  network_interface {
	network = "${google_compute_network.util-vpc.name}"
	access_config {
		// ephemeral ip
	}
  }

  metadata {
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/pubsub", "https://www.googleapis.com/auth/cloud-platform"]
  }
  
  # metadata_startup_script = "${file("startup.sh")}"
}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  name               = "api-group-manager"
  instance_template  = "${google_compute_instance_template.default.self_link}"
  base_instance_name = "api-group-manager"
  zone               = "us-west1-a"
  target_size        = "1"
  
  named_port {
    name = "http"
    port = 8080
  }
}