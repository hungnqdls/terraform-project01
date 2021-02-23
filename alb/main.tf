resource "aws_lb_target_group" "tg01" {
    health_check {
      interval = var.check_health["interval"]
      path = var.check_health["path"]
      protocol = var.check_health["protocol"]
      timeout = var.check_health["timeout"]
      healthy_threshold = var.check_health["healthy_threshold"]
      unhealthy_threshold = var.check_health["unhealthy_threshold"]
    }
    name = "ALB-GROUP-NAME"
    port = var.http_ports
    protocol = var.check_health["protocol"]
    target_type = var.tg_type
    vpc_id = var.vpc-id
}

resource "aws_lb_target_group_attachment" "lb_attach01" {
    target_group_arn = aws_lb_target_group.tg01.arn
    target_id = var.instance1_id
    port = var.http_ports
}

resource "aws_lb_target_group_attachment" "lb_attach02" {
    target_group_arn = aws_lb_target_group.tg01.arn
    target_id = var.instance2_id
    port = var.http_ports
  
}
resource "aws_lb" "alb01" {
    name = var.env_name["alb_name"]
    internal = var.internals
    security_groups = [ "var.alb_sg", ]
    subnets = [ "var.pub_subnet1","var.pub_subnet2" ]
    ip_address_type = var.ip_type
    load_balancer_type = var.lb_type
}