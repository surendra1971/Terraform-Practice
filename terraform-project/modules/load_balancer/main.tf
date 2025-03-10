module "load_balancer" {
  source     = "./modules/load_balancer"
  project_id = var.project_id
  region     = var.region
  vpc_network = module.network.vpc_network
}

resource "google_compute_global_address" "lb_ip" {
  name = "lb-ip"
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.lb_map.self_link
}

resource "google_compute_url_map" "lb_map" {
  name = "lb-map"

  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_backend_service" "default" {
  name                  = "backend-service"
  load_balancing_scheme = "EXTERNAL"
  protocol              = "HTTP"
  backend {
    group = google_compute_instance_group.web.self_link
  }
}

resource "google_compute_global_forwarding_rule" "http" {
  name       = "http-forwarding-rule"
  ip_address = google_compute_global_address.lb_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.self_link
}

