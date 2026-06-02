# Sysops Shield: Infraestructura de Red y Cómputo Segura en AWS con IaC

¡Bienvenido a **Sysops Shield**! Este proyecto despliega de forma totalmente automatizada una arquitectura de red modular, escalable y segura en Amazon Web Services (AWS) utilizando Terraform como herramienta de Infraestructura como Código (IaC).

El objetivo principal es garantizar el aislamiento estricto de las capas de cómputo crítico, siguiendo las mejores prácticas de seguridad en la nube (Well-Architected Framework).

---

## 🚀 Impacto e Ingeniería

*   **Seguridad Perimetral Avanzada:** Aislamiento estricto de las instancias EC2 críticas. Los servidores de backend se despliegan en subredes privadas sin direccionamiento público directo, protegiéndolos de escaneos maliciosos de internet.
*   **Acceso Seguro a Internet (NAT Gateway):** Las instancias privadas pueden descargar actualizaciones de paquetes y comunicarse con el exterior de forma segura a través de un NAT Gateway situado en la capa pública, impidiendo conexiones entrantes no solicitadas.
*   **IaC Reutilizable y Modular:** El proyecto no utiliza un único archivo plano. Está diseñado basándose en **módulos limpios e independientes** de Terraform (`vpc` y `compute`), lo que reduce drásticamente los tiempos de replicación y permite reutilizar el código para entornos de Desarrollo, Staging o Producción con solo cambiar variables.

---

## 🛠️ Tecnologías Utilizadas

*   **Proveedor Cloud:** AWS (VPC, EC2, Internet Gateway, NAT Gateway, Route Tables, Security Groups).
*   **Herramienta de IaC:** Terraform (>= 1.0.0).
*   **Sistema Operativo Base:** Amazon Linux 2 (recuperado dinámicamente mediante filtros de AMI).

---

## 📁 Estructura del Proyecto

El repositorio sigue un estándar de organización profesional:

```text
sysops-shield/
├── providers.tf          # Configuración del proveedor de AWS y versiones requeridas
├── variables.tf          # Variables globales del proyecto raíz (región, entorno)
├── main.tf               # Orquestación central del despliegue invocando a los módulos
├── outputs.tf            # Datos de salida expuestos tras el despliegue (VPC ID, IPs Privadas)
├── .gitignore            # Exclusión de archivos locales temporales y estados de Terraform
└── modules/
    ├── vpc/              # Módulo encargado de toda la topología de red modular
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── compute/          # Módulo de cómputo aislado y grupos de seguridad perimetrales
        ├── main.tf
        ├── variables.tf
        └── outputs.tf