variable "vpc_name" {
    description = "Default VPC name"
    default     = "default"
}

variable "my_subnet" {
    description = "Default subnet data"
    type = object({
        name     = string
        ip_range = string
        region   = string
    })

    default = {
        name     = "subnet1"
        ip_range = "10.127.0.0/20"
        region   = "us-central1"
    }
}

variable "firewall_ports" {
    description = "Open ports list"
    default     = ["80", "8080", "1000-2000", "22"]
}

variable "firewall_name" {
    description = "Default Firewall name"
    default     = "test-firewall"
}

variable "my_compute_instance" {
    description = "Default compute instance data"
    type = object({
        name                    = string
        machine_type            = string
        image                   = string
        metadata_startup_script = string
    })

    default = {
        name                    = "nginx-proxy"
        machine_type            = "f1-micro"
        image                   = "debian-cloud/debian-11"
        metadata_startup_script = "apt update && apt install -y nginx && systemctl start nginx"
    }
}