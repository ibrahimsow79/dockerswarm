# Building the environment for i-decide application. Both Dev ad Prod envrionments are very similar.
# Define AWS as our provider
provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_file = "${var.my_credentials}"
  profile = "${var.my_profile}"
  version = "~> 2.32"
}


# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name   = "vpc_keypair"
  public_key = "${file("${var.key_path}")}"
}

# Mettre le fichier tfstate sur S3 : idecide-er-admin- - Terraform ne permet dpas la variabilisation du backend
terraform {
  backend "s3" {
  bucket = "dockerswarm-isow-configuration"
  key    = "dockerswarm/main/terraform.tfstate"
  region =  "eu-west-3"
  }
}

data "aws_iam_role" "iam-read-s3" {
  name = "aws-s3-read-policy"
  
}

# Ai rajouté les lignes pour variabilser les "availability zone" dans le script terraform
data "aws_availability_zones" "available" {}

module "vpc" {
  source = "./vpc/"

  aws_az_a 				= "${var.aws_az_a}"
  aws_az_b 				= "${var.aws_az_b}"
  aws_az_c				= "${var.aws_az_c}"
  vpc_cidr				= "${var.vpc_cidr}"
  public_subnet_cidr_a 	= "${var.public_subnet_cidr_a}"
  public_subnet_cidr_b	= "${var.public_subnet_cidr_b}"
  public_subnet_cidr_c  = "${var.public_subnet_cidr_c}"  
  private_subnet_cidr_a = "${var.private_subnet_cidr_a}"
  private_subnet_cidr_b = "${var.private_subnet_cidr_b}"
  private_subnet_cidr_c = "${var.private_subnet_cidr_c}"
  env 					= "${var.env}" 
}

module "manager1" {
  source = "./ec2/docker/"

  ami	            = "${var.ami_docker}"
  instance_type     = "${var.instance_type_docker}"
  sg_dockerswarm_id  = "${module.vpc.sg_dockerswarm_id}"
  public_subnet_id  = "${module.vpc.public_subnet_a_id}"
  private_subnet_id = "${module.vpc.private_subnet_a_id}"
  key_pair          = "${aws_key_pair.default.id}"
  private_ip        = "${var.private_ip_manager_1}"
  instance_name     = "${var.instance_name_manager_1}"
  env               = "$var.env}"
}


resource "aws_eip" "appidecide_public_ip" {
  instance = "${module.appidecide.appidecide_id}"
  vpc      = true
  tags = {
    Name          = "EIP appidecide"
    location      = "paris"
    environnement = "${var.env}"
    client        = "idecide"
  }
}

module "sqlclient" {
  source = "./ec2/sqlclient/"
  
  ami 				= "${var.ami_sqlclient}"
  sg_sqlclient_id   = "${module.vpc.sg_sqlclient_id}"
  public_subnet_id_a  = "${module.vpc.public_subnet_a_id}"
  private_subnet_id = "${module.vpc.private_subnet_a_id}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "${var.name_sqlclient}"
  private_ip        = "${var.private_ip_sqlclient}"
  instance_type     = "${var.instance_type_sqlclient}"
  env				= "${var.env}"
  
}
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my_db_subnet_group"
  subnet_ids = ["${module.vpc.private_subnet_a_id}", "${module.vpc.private_subnet_b_id}"]
  tags = {
    Name = "My DB subnet group"
  }
}

module "db" {
  source = "./database/"

  allocated_storage  = "${var.allocated_storage_space}"
  storage_type       = "${var.storage_type}"
  engine			 = "${var.engine}"
  engine_version     = "${var.engine_version}"
  instance_class     = "${var.instance_class}"
  db_name            = "${var.db_name}" 
  username           = "${var.username}"
  password           = "${var.password}"
  db_subnet_group    = "${aws_db_subnet_group.my_db_subnet_group.id}"
  db_security_group  = "${module.vpc.sg_db_idecide_id}"
  env                = "${var.env}"
  name				 = "${var.name}"
  db_identifier      = "${var.db_identifier}"
}
