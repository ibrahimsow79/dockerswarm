# Define our VPC to be used by the application

resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  
    tags = {
    Name          = "vpc-idecide"
    location      = "paris"
    environnement = "${var.env}"
    client        = "idecide"
  }
}

# Define the public subnets : 3 public subnets one in AZ-a, one in AZ-b and one in AZ-c	

resource "aws_subnet" "public_subnet_a" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_cidr_a}"
  availability_zone = "${var.aws_az_a}"

  tags = {
    Name          = "Public Subnet a"
    location      = "paris"
    environnement = "${var.env}"
    client        = "dockerswarm	"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_cidr_b}"
  availability_zone = "${var.aws_az_b}"

  tags = {
    Name          = "Public Subnet b"
    location      = "paris"
    environnement = "${var.env}"
    client        = "dockerswar"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_cidr_c}"
  availability_zone = "${var.aws_az_c}"

  tags = {
    Name          = "Public Subnet c"
    location      = "paris"
    environnement = "${var.env}"
    client        = "dockerswarm"
  }
}

# Define the private subnets : 2 private subnets one in AZ-a and one in AZ-b

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_subnet_cidr_a}"
  availability_zone = "${var.aws_az_a}"

  tags = {
    Name          = "Private subnet a"
    location      = "paris"
    environnement = "${var.env}"
    client        = "dockerswarm"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_subnet_cidr_b}"
  availability_zone = "${var.aws_az_b}"

  tags = {
    Name          = "Private subnet b"
    location      = "paris"
    environnement = "${var.env}"
    client        = "dockerswarm"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_subnet_cidr_c}"
  availability_zone = "${var.aws_az_c}"

  tags = {
    Name          = "Private subnet c"
    location      = "paris"
    environnement = "${var.env}"
    client        = "dockerswarm"
  }
}



# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags = {
    Name          = "VPC IGW"
    location      = "paris"
    environnement = "${var.env}"
    client        = "dockerswarm"
  }
}

# Define the route table
resource "aws_route_table" "web_public_rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name          = "Public Subnet RT"
    location      = "paris"
    environnement = "${var.env}"
    client        = "idecide"
  }
}

# Assign the route table to the public Subnet (public-subnet-a, public-subnet-b et public-subnet-c)
resource "aws_route_table_association" "web_public_rt_a" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.web_public_rt.id}"
}

resource "aws_route_table_association" "web_public_rt_b" {
  subnet_id      = "${aws_subnet.public_subnet_b.id}"
  route_table_id = "${aws_route_table.web_public_rt.id}"
}

resource "aws_route_table_association" "web_public_rt_c" {
  subnet_id      = "${aws_subnet.public_subnet_c.id}"
  route_table_id = "${aws_route_table.web_public_rt.id}"
}

# Define the security group for appidedcide VM


resource "aws_security_group" "sg_dockerswarm" {
  name        = "sg_dockerswarm"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
	description = "IP Publique idecide"
  } 
  
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["37.71.126.132/32"]
	description = "IP Publique ISOW OnePoint, For testing purpose then should be removed"
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.default.id}"

  tags = {
    Name          = "sg appidecide"
    location      = "paris"
    environnement = "${var.env}"
    client        = "idecide"
  }
}



