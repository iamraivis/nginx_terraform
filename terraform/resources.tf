module "networkModule" {
    source                   = "./modules/network"
	    access_key           = "${var.access_key}"
		secret_key           = "${var.secret_key}"
		region               = "${var.region}"
		environment_tag      = "${var.environment_tag}"
		project_tag          = "${var.project_tag}"
		department_tag       = "${var.department_tag}"
}

module "securityGroupModule" {
    source                   = "./modules/securityGroup"
	    access_key           = "${var.access_key}"
		secret_key           = "${var.secret_key}"
		region               = "${var.region}"
		vpc_id               = "${module.networkModule.vpc_id}"
		environment_tag      = "${var.environment_tag}"
		project_tag          = "${var.project_tag}"
		department_tag       = "${var.department_tag}"
}

module "instanceModule" {
    source                   = "./modules/instance"
	    access_key           = "${var.access_key}"
		secret_key           = "${var.secret_key}"
		region               = "${var.region}"
		vpc_id               = "${module.networkModule.vpc_id}"
		subnet_public_id     = "${module.networkModule.public_subnets[0]}"
		security_group_ids   = ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80}"]
		environment_tag      = "${var.environment_tag}"
		project_tag          = "${var.project_tag}"
		department_tag       = "${var.department_tag}"
}
