resource "aws_instance" "jenkins" {
    ami                    = var.ami_id
    subnet_id              = module.public_subnet.subnet_ids[0]
    vpc_security_group_ids = [module.securitygroup.ee-jenkins]
    instance_type          = var.instance_type
    #availability_zone     = "${var.aval_zone}"
    key_name               = aws_key_pair.ee.key_name
    user_data              = data.template_file.init.rendered
    
    tags = {
      Name = "${var.tenant}-${var.id}-jenkins"
    }
}

data "template_file" "init" {
   template = "${file("${var.user_data}")}"
   vars = {
        ENVIRONMENT = var.env
        REGION = var.region
    }
}

