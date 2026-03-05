output "public_instance_ips" {
  value = values(module.ec2_instances_public)[*].public_ip
}

output "public_instance_private_ips" {
  value = values(module.ec2_instances_public)[*].private_ip
}

output "private_instance_ips" {
  value = values(module.ec2_instances_private)[*].private_ip
}