variable "ami" {
  description = "Amazon Linux AMI"
}

variable "private_ip" {
	description = "Private IP address of appidecide VM"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "C:\\Users\\i.sow\\.ssh\\id_rsa.pub"
}

variable "sg_dockerswarm_id" {
  description = "Security Group of appidecide VM"
}

variable "public_subnet_id" {}

variable "private_subnet_id" {}

variable "instance_type" {
  description = "Instance Type"
}

variable "key_pair" {
  description = "Identifier of the key pair used to connect to root"
}
variable "env" {
 description = "environnement : prod, dev, int,rec"
}
variable "instance_name" {
 description = "Instance_name"
}