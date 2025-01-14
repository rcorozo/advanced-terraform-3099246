### NETWORK
data "google_compute_network" "default" {
  name                    = var.vpc_name
}

## SUBNET
resource "google_compute_subnetwork" "subnet-1" {
  name                     = var.my_subnet.name
  ip_cidr_range            = var.my_subnet.ip_range
  network                  = data.google_compute_network.default.self_link
  region                   = var.my_subnet.region
  private_ip_google_access = true
}

resource "google_compute_firewall" "default" {
  name    = var.firewall_name
  network = data.google_compute_network.default.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }

  // source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}

### COMPUTE
## NGINX PROXY
resource "google_compute_instance" "nginx_instance" {
  name         = var.my_compute_instance.name
  machine_type = var.my_compute_instance.machine_type
  tags = ["web"]
  
  boot_disk {
    initialize_params {
      image = var.my_compute_instance.image
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = var.my_compute_instance.metadata_startup_script
}

## WEB1
resource "google_compute_instance" "web1" {
  name         = "web1"
  machine_type = var.my_compute_instance.machine_type
  
  boot_disk {
    initialize_params {
      image = var.my_compute_instance.image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }
}
## WEB2
resource "google_compute_instance" "web2" {
  name         = "web2"
  machine_type = var.my_compute_instance.machine_type
  
  boot_disk {
    initialize_params {
      image = var.my_compute_instance.image
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }
}
## WEB3
resource "google_compute_instance" "web3" {
  name         = "web3"
  machine_type = var.my_compute_instance.machine_type
  
  boot_disk {
    initialize_params {
      image = var.my_compute_instance.image
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }  
}

## DB
resource "google_compute_instance" "mysqldb" {
  name         = "mysqldb"
  machine_type = var.my_compute_instance.machine_type
  
  boot_disk {
    initialize_params {
      image = var.my_compute_instance.image
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }
}