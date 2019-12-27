
output "appidecide_ip" {
  value = "${aws_eip.appidecide_public_ip.public_ip}"
}

output "sqlclient_ip" {
  value = "${module.sqlclient.sqlclient_ip}"
}

output "db_subnet_group_id" {
  value = "${aws_db_subnet_group.my_db_subnet_group.id}"
}


output "database_endpoint" {
  value = "${module.db.database_endpoint_id}"
}
