output "external_ips" {
  value = [for instance in aws_instance.example : instance.public_ip]
}

output "internal_ips" {
  value = [for instance in aws_instance.example : instance.private_ip]
}

output "ssh_commands" {
  value = [for instance in aws_instance.example : "ssh -i your-key.pem ec2-user@${instance.public_ip}"]
}

output "rdp_commands" {
  value = [for instance in aws_instance.example : "mstsc /v:${instance.private_ip} "]
}