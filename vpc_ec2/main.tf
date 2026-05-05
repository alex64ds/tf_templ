# Region y provedor
provider "aws" {
    region = "us-east-1"
}
# Crear VPC
resource "aws_vpc" "mi_vpc" {
    cidr_block = "192.168.0.0/16"

    tags = {
        Name = "tf-mi_vpc"
    }
}

# Crear Subred

resource "aws_subnet" "mi_subnet" {
    vpc_id = aws_vpc.mi_vpc.id
    cidr_block = "192.168.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "tf-mi_subnet"
    }
}

# Crar grupo de seguridad

resource "aws_security_group" "gs_migrupo" {
    name = "sg_migrupo"
            vpc_id = aws_vpc.mi_vpc.id


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        description = "Acceso al puerto 80 desde el exterior"
        cidr_blocks = ["0.0.0.0/0"]

    }

}

# Crear EC2

resource "aws_instance" "mi_ec2" {
    ami = "ami-091138d0f0d41ff90"
    instance_type = "t3.micro"
    key_name = "vockey"
    subnet_id = aws_subnet.mi_subnet.id
    associate_public_ip_address = "true"
    vpc_security_group_ids = [aws_security_group.gs_migrupo.id]

    tags = {
        Name = "terraform-example"
    }
}

output "public_ip" {
    description = "IP publica de la instancia"
    value = aws_instance.mi_ec2.public_ip
}
