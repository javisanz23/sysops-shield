variable "aws_region" {
  type        = string
  default     = "eu-west-1" # Modifica esto por tu región más cercana o de pruebas
  description = "Región de AWS"
}

variable "environment" {
  type        = string
  default     = "production"
  description = "Entorno principal"
}