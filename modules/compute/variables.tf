variable "vpc_id" {
  type        = string
  description = "ID de la VPC"
}

variable "private_subnet_id" {
  type        = string
  description = "ID de la subred privada donde irá la EC2"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Tipo de instancia de EC2"
}

variable "environment" {
  type        = string
  description = "Entorno de despliegue"
}