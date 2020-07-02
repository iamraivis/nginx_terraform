output "public_ip" {
  value = "${module.instanceModule.instance_eip}"
}

output "vpc_id" {
  value = "${module.networkModule.vpc_id}"
}

output "public_subnets" {
  value = "${module.networkModule.public_subnets}"
}

output "security_groups" {
  value = ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80}"]
}
