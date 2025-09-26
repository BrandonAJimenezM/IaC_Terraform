# 🚀 Terraform - GCP Compute Engine

Este proyecto crea una **máquina virtual (VM)** en **Google Cloud Platform (GCP)** utilizando **Terraform**.  
Permite personalizar parámetros de la VM mediante variables.

---

## 📂 Estructura del proyecto

- `main.tf` → Configuración principal de Terraform
- `variables.tf` → Definición de variables
- `outputs.tf` → Valores de salida (IP pública, nombre de VM, etc.)
- `.gitignore` → Ignorar archivos sensibles y generados
- `README.md` → Documentación del proyecto


---

## ⚙️ Requisitos

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.0+
- Cuenta de [Google Cloud](https://cloud.google.com/)
- Un proyecto en GCP con **Compute Engine API habilitada**
- Archivo de credenciales en formato JSON (Service Account) - IAM

---

## 📌 Variables principales

| Variable            | Descripción                                   | Default                  |
|---------------------|-----------------------------------------------|--------------------------|
| `project`           | ID del proyecto en GCP                        | — (obligatorio)          |
| `credentials_file`  | Ruta al archivo de credenciales JSON          | — (obligatorio)          |
| `region`            | Región donde se desplegará la VM              | `us-central1`            |
| `zone`              | Zona donde se desplegará la VM                | `us-central1-a`          |
| `os_image`          | Imagen base del SO                            | `debian-cloud/debian-12` |
| `vm_params`         | Objeto con parámetros de la VM                | Ver detalle abajo        |

### 📌 `vm_params` (objeto)
- `name`: Nombre de la VM  
- `machine_type`: Tipo de máquina (`e2-micro`)  
- `zone`: Zona de despliegue  
- `allow_stopping_for_update`: Permitir detener VM para actualizaciones  

Ejemplo:
```hcl
vm_params = {
  name                      = "terraform-instance"
  machine_type              = "e2-micro"
  zone                      = "us-central1-a"
  allow_stopping_for_update = true
}
```
---
## 🚀 Uso

Clonar el repositorio:
```
git clone https://github.com/BrandonAJimenezM/IaC_Terraform
cd IaC_Terraform
```


Configurar credenciales:
Guarda tu archivo de credenciales JSON (service account) en la raíz del proyecto y asigna su ruta en terraform.tfvars:
```hcl
project          = "tu-project-id"
credentials_file = "credenciales.json"
```

Inicializar Terraform:
```hcl
terraform init
```


Previsualizar cambios:
```hcl
terraform plan
```


Aplicar configuración:
```hcl
terraform apply
```

📤 Outputs
```hcl
ip_publica_vm → IP pública de la VM creada

vm_info → Mapa con nombre e IP de la VM
```
Ejemplo:
```hcl
ip_publica_vm = "34.125.50.23"
vm_info = {
  "nombre" = "sys-terraform-instance"
  "ip"     = "34.125.50.23"
}
```
🛑 Destrucción de recursos

Para eliminar la VM creada:
```
terraform destroy
```
---
## 📝 Notas

Los archivos *.tfstate, credenciales (.json) y .terraform/ no deben subirse al repositorio.


👨‍💻 Autor: Brandon Jiménez
📅 Fecha: 19 de Septiembre 2025

---

