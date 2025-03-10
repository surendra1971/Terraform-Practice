### outputs.tf
output "vpc_network" {
  value = google_compute_network.vpc.self_link
}
output "public_subnet" {
  value = google_compute_subnetwork.public.self_link
}