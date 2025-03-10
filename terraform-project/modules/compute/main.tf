module "compute" {
  source       = "./modules/compute"
  project_id   = var.project_id
  region       = var.region
  zone         = "${var.region}-a"
  vpc_network  = module.network.vpc_network
  subnet       = module.network.public_subnet
}

resource "google_compute_instance" "web" {
  name         = "web-instance"
  machine_type = "e2-medium"
  zone         = var.zone
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  
  network_interface {
    network    = var.vpc_network
    subnetwork = var.subnet
    access_config {}
  }
}