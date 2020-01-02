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

variable "instance_name_manager_1" {
  description = "Instance Name"
  default = "manager_1"
}  

variable "instance_name_manager_2" {
  description = "Instance Name"
  default = "manager_2"
}

variable "instance_name_manager_3" {
  description = "Instance Name"
  default = "manager_33"
}

variable "instance_name_worker_1" {
  description = "Instance Name"
  default = "worker_1"
}

variable "instance_name_worker_2" {
  description = "Instance Name"
  default = "worker_2"
}

variable "instance_name_work_3" {
  description = "Instance Name"
  default = "worker_3"
}

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
