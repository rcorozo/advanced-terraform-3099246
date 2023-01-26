output "ephemeral_public_ip" {
    value = nginx_instance.network_interface.0.network_ip
}