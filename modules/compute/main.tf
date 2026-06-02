# Obtener dinámicamente la última AMI de Amazon Linux 2
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Security Group Seguro (Aislamiento Perimetral)
resource "aws_security_group" "ec2_sg" {
  name        = "${var.environment}-ec2-sg"
  description = "Security Group restrictivo para instancias criticas privadas"
  vpc_id      = var.vpc_id

  # Permitimos todo el tráfico saliente para que pueda actualizarse a través de la NAT Gateway
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-ec2-sg"
    Environment = var.environment
  }
}

resource "aws_instance" "backend" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name        = "${var.environment}-backend-instance"
    Environment = var.environment
  }
}