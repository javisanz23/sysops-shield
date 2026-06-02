variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block para la VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDR blocks para las subredes públicas"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
  description = "CIDR blocks para las subredes privadas"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"] # Cambia a tu región preferida (us-east-1a, etc.)
  description = "Zonas de disponibilidad"
}

variable "environment" {
  type        = string
  description = "Entorno de despliegue (ej: production)"
}