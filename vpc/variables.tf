# Attention pour l'adressage IP, il fait éviter les collisions. 


# CIDR Block Notation for the VPC
variable "vpc_cidr" {
  description = "CIDR for the VPC"
}

# Definition of AZs
variable "aws_az_a" {
  description = "Availbaility Zone a"
}
variable "aws_az_b" {
  description = "Availbaility Zone b"
}

# Definition of Environnment
variable "env" {
 description = "environnement : prod, dev, int,rec"
}

# CIDR Block Notation of the Public Subnets
variable "public_subnet_cidr_a" {
  description = "CIDR for the public subnet"
}

variable "public_subnet_cidr_b" {
  description = "CIDR for the public subnet"
}

#CIDR Block Notation of the Private Subnets
variable "private_subnet_cidr_a" {
  description = "CIDR for the private subnet"
}

variable "private_subnet_cidr_b" {
  description = "CIDR for the public subnet"
}
