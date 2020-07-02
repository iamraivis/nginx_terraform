data  "template_file" "ec2_instance" {
    template = "${file("./templates/ec2_instance.tpl")}"
    vars = {
        public_ip = "${module.instanceModule.instance_eip}"
    }
}

resource "local_file" "ec2_instance_file" {
  content  = "${data.template_file.ec2_instance.rendered}"
  filename = "./inventory/myhost"
}
