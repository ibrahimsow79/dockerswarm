# Define appidecide VML inside the public subnet  a

resource "aws_instance" "appidecide" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_pair}"
  subnet_id                   = "${var.public_subnet_id}"
  vpc_security_group_ids      = ["${var.sg_dockerswarm_id}"]
  associate_public_ip_address = true
  private_ip                  = "${var.private_ip}"
  source_dest_check           = false
  iam_instance_profile        = "aws-s3-read-policy"
  user_data                   = "${file("ec2/appidecide/install.sh")}"

  tags = {
    Name          = "{var.instance_name}"
    location      = "paris"
    environnement = "${var.env}"
    client        = "idecide"
  }
}
