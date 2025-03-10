module "compute" {
  source       = "./modules/compute"
  project_id   = var.project_id
  region       = var.region
  zone         = "${var.region}-a"
  vpc_network  = module.network.vpc_network
  subnet       = module.network.public_subnet
}

module "storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  region      = var.region
  bucket_name = "web-app-static-assets"
}
