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
  sg_dockerswarm_id = "${module.vpc.sg_dockerswarm_id}"
  public_subnet_id  = "${module.vpc.public_subnet_a_id}"
  private_subnet_id = "${module.vpc.private_subnet_a_id}"
  key_pair          = "${aws_key_pair.default.id}"
  private_ip        = "${var.private_ip_manager_1}"
  instance_name     = "${var.instance_name_manager_1}"
  env               = "$var.env}"
}
