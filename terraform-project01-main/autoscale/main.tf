resource "aws_launch_configuration" "autosclconfig" {
    image_id = data.aws_ami.amazon-linux-2.id
    instance_type = var.type_instance
    security_groups = [ "var.webapp_sg" ]
    user_data = data.template_file.web_config.rendered
    lifecycle {
      create_before_destroy = true
    }

}

resource "aws_autoscaling_group" "auscle01" {
    launch_configuration = aws_launch_configuration.autosclconfig.name
    vpc_zone_identifier  = [ "var.pub_subnet1","var.pub_subnet2"]
    target_group_arns = [ "var.alb_target_group_arn" ]
    health_check_type = var.type_healthcheck
    min_size = var.size_count["min"]
    max_size = var.size_count["max"]
    tags = [ {
        "Name" = "AUTO SCALING GROUP"
        "propagate_at_launch" = "true"
    } ]

  
}