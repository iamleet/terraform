variable "region" {}

variable "amis" {
  type = "map"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
