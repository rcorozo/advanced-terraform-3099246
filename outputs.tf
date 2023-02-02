### OUTPUTS ###
output "nginx-public-ip" {
    value = google_compute_instance.this-nginx.network_interface[0].access_config[0].nat_ip
}

output "webserver-ips" {
    value = google_compute_instance.this-web[*].network_interface[0].network_ip
}

output "db-private-ip" {
    value = google_compute_instance.mysqldb.network_interface[0].network_ip
}