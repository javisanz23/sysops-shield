output "deployed_vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID de la VPC de producción generada"
}

output "secure_instance_private_ip" {
  value       = module.compute.instance_private_ip
  description = "Dirección IP privada y aislada de la instancia EC2"
}