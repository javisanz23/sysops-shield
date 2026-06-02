# Invocación del módulo de Redes
module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
}

# Invocación del módulo de Cómputo Seguro pasándole los outputs del módulo VPC
module "compute" {
  source            = "./modules/compute"
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_ids[0] # Elige la primera subred privada
  environment       = var.environment
}