resource "aws_security_group" "alb" {
  vpc_id = var.vpc-id
  name = var.sg_name
  ingress {
  cidr_blocks = var.public_cidr
  description = "Allow HTTP"
  from_port = var.ingress_alb["http"]
  to_port = var.ingress_alb["http"]
  protocol = var.ingress_alb["protocol"]
  }
  ingress {
    cidr_blocks = var.public_cidr
    description = "Allow HTTPS"
    from_port = var.ingress_alb["https"]
    to_port = var.ingress_alb["https"]
    protocol = var.ingress_alb["protocol"]
  }
}