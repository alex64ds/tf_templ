module "vpc" {
    source   = "./modulos/vpc"
    vpc_cidr = "10.0.0.0/16"
    vpc_name = "miVPC"
    subnet_publica_cidr = "10.0.1.0/24"
    subnet_privada_cidr = "10.0.2.0/24"
}

# module "ec2" {
#     source = "./modulos/ec2"
#    instance_type = "t2.micro"
#    ami_id = "ami-091138d0f0d41ff90"
#    subnet_id = module.vpc.subnet_publica_id
#}

output "vpc_id" {
    value = module.vpc.vpc_id
}

# output "ec2_id" {
#     value = module.ec2.instance_id
# }