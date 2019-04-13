resource "google_compute_global_forwarding_rule" "forwarding-rule" {
  name       = "api-forwarding-rule"
  target     = "${google_compute_target_http_proxy.default.self_link}"
  port_range = "80"
  ip_address = "${google_compute_global_address.api-ip.address}"
}

resource "google_compute_global_forwarding_rule" "forwarding-rule-6" {
  name       = "api-forwarding-rule-6"
  target     = "${google_compute_target_http_proxy.default.self_link}"
  port_range = "80"
  ip_address = "${google_compute_global_address.api-ip-6.address}"
}

resource "google_compute_target_http_proxy" "default" {
  name             = "api-proxy"
  description      = "Backend for api"
  url_map          = "${google_compute_url_map.default.self_link}"
}

resource "google_compute_url_map" "default" {
  name        = "lb"
  description = "a description"

  default_service = "${google_compute_backend_service.api.self_link}"
 }

resource "google_compute_backend_service" "api" {
  name        = "api-lb"
  description = "API LB"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 30
  enable_cdn  = false

  backend {
    group = "${google_compute_instance_group_manager.instance_group_manager.instance_group}"
  }

  health_checks = ["${google_compute_http_health_check.api-health.self_link}"]
}

resource "google_compute_http_health_check" "api-health" {
  name               = "api-health"
  request_path       = "/_health"
  port               = 8080
  check_interval_sec = 1
  timeout_sec        = 1
}