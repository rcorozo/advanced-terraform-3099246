### NETWORK
data "google_compute_network" "default" {
  name                    = "default"
}

## SUBNET
resource "google_compute_subnetwork" "subnet-1" {
  name                     = "subnet1"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = data.google_compute_network.default.id
  region                   = "us-central1"
  private_ip_google_access = true
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = data.google_compute_network.default.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_tags = ["web"]
}

### COMPUTE
## NGINX PROXY
resource "google_compute_instance" "nginx_instance" {
  name         = "nginx-proxy"
  machine_type = "f1-micro"
  tags = ["web"]
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = data.google_compute_network.default.id
    subnetwork = google_compute_subnetwork.subnet-1.id
    /* access_config {
      
    } */
  }
}