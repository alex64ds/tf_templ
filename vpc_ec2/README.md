#  Infraestructura AWS con Terraform

Este proyecto define una infraestructura básica en AWS utilizando **Terraform**. Se despliegan los siguientes recursos:

- VPC personalizada  
- Subred pública  
- Grupo de seguridad  
- Instancia EC2  

---

## Arquitectura

La infraestructura creada incluye:

- **VPC**: `192.168.0.0/16`
- **Subred**: `192.168.0.0/24` en `us-east-1a`
- **Grupo de Seguridad**:
  - Permite tráfico HTTP (puerto 80) desde cualquier origen
- **Instancia EC2**:
  - Tipo: `t3.micro`
  - IP pública habilitada
  - Acceso mediante clave SSH (`vockey`)

---


##  Requisitos

Antes de comenzar, asegúrate de tener:

- Terraform instalado (>= 1.x)
- Cuenta en AWS
- Credenciales configuradas (`aws configure`)
- Una clave SSH existente en AWS llamada `vockey`

---

## Despliegue

1. Inicializar Terraform:

```bash
terraform init
```

2. Validar la configuración:
```bash
terraform validate
```
Ver el plan de ejecución:
```bash
terraform plan
```
Aplicar la infraestructura:
```bash
terraform apply
```
Confirma escribiendo `yes` cuando se solicite.

---

## Acceso a la instancia

Una vez creada la instancia EC2:

1. Obtén la IP pública:
```bash
terraform output
```

o desde la consola de AWS.

Accede por SSH:
```bash
ssh -i tu_clave.pem ec2-user@<IP_PUBLICA>
```
## Seguridad

El grupo de seguridad permite:

- Acceso HTTP (puerto 80) desde cualquier IP (0.0.0.0/0)

 **Recomendación**: Restringir el acceso en entornos de producción.

## Destruir la infraestructura

Para eliminar todos los recursos creados:

```bash
terraform destroy
```


