variable "aws_region" {
  description = "Region for the VPC"
  default     = "eu-west-3"
}

variable "aws_az_a" {
  description = "Availablity Zone a"
  default     = "eu-west-3a"
}

variable "aws_az_b" {
  description = "Availability Zone b"
  default     = "eu-west-3b"
}

variable "aws_az_c" {
  description = "Availability Zone c"
  default     = "eu-west-3c"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.60.0.0/16"
}

# CIDR Block Notation of the Public Subnets
variable "public_subnet_cidr_a" {
  description = "CIDR for the public subnet"
  default     = "10.60.10.0/24"
}

variable "public_subnet_cidr_b" {
  description = "CIDR for the public subnet"
  default     = "10.60.20.0/24"
}

variable "public_subnet_cidr_c" {
  description = "CIDR for the public subnet"
  default     = "10.60.30.0/24"
}

#CIDR Block Notation of the Private Subnets
variable "private_subnet_cidr_a" {
  description = "CIDR for the private subnet"
  default     = "10.60.40.0/24"
}

variable "private_subnet_cidr_b" {
  description = "CIDR for the public subnet"
  default     = "10.60.50.0/24"
}

variable "private_subnet_cidr_c" {
  description = "CIDR for the public subnet"
  default     = "10.60.60.0/24"
}
variable "key_path" {
  description = "SSH Public Key path"
  default = "C:\\Users\\i.sow\\.ssh\\id_rsa.pub"
}

variable "windows_key_path" {
  default = ".ssh/win.pem"
}

variable "env" {
 description = "environnement : prod, dev, int,rec"
 default = "dev"
}
variable "my_credentials" {
 description = " Credentials being used to connect to AWS"
 default = "/c/Users/isow/.aws/credentials"
}
 
variable "my_profile" {
 description = " profile being used to connect to AWS"
 default = "ibrahim_sow"
}
#======= nom de l'instance Manager1===========
variable "intance_name_manager_1 {
  description = "Nom de l'instance"
  default = "manager-1"
  
#======= nom de l'instance Manager1===========
variable "intance_name_manager_2 {
  description = "Nom de l'instance"
  default = "manager-2"

#======= nom de l'instance Manager1===========
variable "intance_name_manager_3 {
  description = "Nom de l'instance"
  default = "manager-3"


#======= nom de l'instance worker 1===========
variable "intance_name_worker_1 {
  description = "Nom de l'instance"
  default = "manager-3"

#======= nom de l'instance Worker 2===========
variable "intance_name_worker_2 {
  description = "Nom de l'instance"
  default = "worker-2"

#======= nom de l'instance Worker 3===========
variable "intance_name_work_3 {
  description = "Nom de l'instance"
  default = "worker-3"

# ================== Manager1 VM ==============
variable "private_ip_manager_1" {
	description = "Private IP address of manager 1 VM"
	default = "10.60.10.10"
}

# ================== Manager2 VM =================
variable "private_ip_manager_2" {
	description = "Private IP address of manager 2 VM"
	default = "10.60.20.10"
}

# ================== Manager3 VM =================
variable "private_ip_manager_3" {
	description = "Private IP address of manager 3 VM"
	default = "10.60.30.10"
}

# ================== Worker 1 VM ================
variable "private_ip_worker_1" {
	description = "Private IP address of worker 1 VM"
	default = "10.60.10.20"
}

# ================== Worker 2 VM ================
variable "private_ip_worker_2" {
	description = "Private IP address of worker 2 VM"
	default = "10.60.20.20"
}

# ================== Worker 3 VM ================
variable "private_ip_worker_3" {
	description = "Private IP address of worker 3 VM"
	default = "10.60.30.20"
}

variable "ami_docker" {
  description = "Amazon Linux AMI"
  default = "ami-03b4b78aae82b30f1"
  
}
variable "instance_type_docker" {
	description = "Type d'instance à utiliser"
	default = "t3a.small"
}
/*
#======================== SQLCLIENT VM     ==============================

variable "private_ip_sqlclient" {
 description = "private ip for sqlclient"
 default = "10.60.10.20"
}

variable "instance_type_sqlclient" {
  description = "Instance Type"
  default     = "t3a.small"
}
variable "ami_sqlclient" {
  description = "Amazon Linux AMI"
  default = "ami-03b4b78aae82b30f1"
  
}

variable "name_sqlclient" {
  description = "Nom de la VM"
  default = "SQLCLIENT" 
}
# ================================================= Database=========================================
 
variable "allocated_storage_space" {
  description = "Disk space allocated for the database"
  default = "20" 
}

variable "storage_type" {
  description = "type of storage to be used for the database"
  default = "gp2" 
}
variable "engine" {
  description = "type of engine Postgre, mysql, Oracle, ...."
  default = "postgres" 
}

variable "engine_version" {
  description = "engine version to be used for the database"
  default = "11.5" 
}

variable "instance_class" {
  description = "instance class for the database"
  default = "db.t3.small" 
}

variable "db_name" {
  description = "Database name"
  default = "dbidecide" 
}

variable "name" {
  description = "Name"
  default = "idecide" 
}

variable "username" {
  description = "user to be created "
  default = "vincent" 
}

variable "password" {
  description = "Password to be used"
  default = "oracle4u" 
}
/*
variable "db_subnet_group" {
  description = "DB Subnet group to be used by the DB"
  default = ""
}
*/
variable "db_security_group" {
  description = "Security Group to be used for the database"
  default = ""
}
 
 variable "db_identifier" {
  description = "DB identifier"
  default = "dbidecide"
}
*/