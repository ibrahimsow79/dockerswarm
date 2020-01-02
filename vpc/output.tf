
output "public_subnet_a_id" {
  value = "${aws_subnet.public_subnet_a.id}"
}

output "public_subnet_b_id" {
  value = "${aws_subnet.public_subnet_b.id}"
}
output "public_subnet_c_id" {
  value = "${aws_subnet.public_subnet_c.id}"
}

output "private_subnet_a_id" {
  value = "${aws_subnet.private_subnet_a.id}"
}

output "private_subnet_b_id" {
  value = "${aws_subnet.private_subnet_b.id}"
}

output "private_subnet_c_id" {
  value = "${aws_subnet.private_subnet_b.id}"
}
output "sg_dockerswarm_id" {
  value = "${aws_security_group.sg_dockerswarm.id}"
}
