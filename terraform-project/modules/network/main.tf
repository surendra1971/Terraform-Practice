module "network" {
  source       = "./modules/network"
  project_id   = var.project_id
  region       = var.region
  vpc_name     = "web-app-vpc"
  public_cidr  = "10.0.1.0/24"
  private_cidr = "10.0.2.0/24"
}



resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name          = "public-subnet"
  ip_cidr_range = var.public_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private" {
  name          = "private-subnet"
  ip_cidr_range = var.private_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

# Allow inbound SSH, HTTP, and HTTPS traffic
resource "google_compute_firewall" "allow_ssh_http_https" {
  name    = "allow-ssh-http-https"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow internal communication within the VPC
resource "google_compute_route" "internal_route" {
  name        = "internal-route"
  network     = google_compute_network.vpc.id
  dest_range  = "10.0.0.0/16"
  next_hop_gateway = "default-internet-gateway"
}
