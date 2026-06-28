output "my_ip_address" {
  value = data.http.my_public_ip.response_body
}