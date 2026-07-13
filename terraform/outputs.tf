output "master_public_ip" {
  value = aws_eip.master_eip.public_ip
}

output "node_private_ips" {
  value = { for k, v in aws_instance.nodes : k => v.private_ip }
}

output "node_public_ips" {
  value = { for k, v in aws_instance.nodes : k => v.public_ip }
}