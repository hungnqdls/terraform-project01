resource "aws_instance" "webapp" {
    count = var.instance_count
    ami = data.aws_ami.amazon-linux-2.id
    instance_type = var.instance_type
    key_name = aws_key_pair.web_app.key_name
    user_data = data.template_file.update.rendered
    subnet_id = var.pub_subnets[count.index] 
    vpc_security_group_ids = [aws_security_group.webapp.id]
    availability_zone = data.aws_availability_zones.available.names[count.index]
    private_ip = var.webapp_static_ip[count.index]
    root_block_device {
     volume_type = var.type_volume["webapp"]
     volume_size = var.size_volume["webapp"]
     encrypted = var.volume_encrypted
   }
   tags = {
     "Name" = "${var.env_name["project_name"]}.${var.env_name["webapp_instance_name"]}.${count.index}"
   }
}

resource "aws_instance" "bastion" {
   count = var.instance_count
   ami = data.aws_ami.amazon-linux-2.id
   instance_type = var.instance_type
   key_name = aws_key_pair.bastion.key_name
   user_data = data.template_file.update.rendered
   subnet_id = var.pub_subnets[count.index]
   vpc_security_group_ids = [aws_security_group.bastion.id]
   availability_zone = data.aws_availability_zones.available.names[count.index]
   root_block_device {
     volume_type = var.type_volume["bastion"]
     volume_size = var.size_volume["bastion"]
     encrypted = var.volume_encrypted
   }
   tags = {
     "Name" = "${var.env_name["project_name"]}.${var.env_name["bastion_instance_name"]}.${count.index}"
   }
}
