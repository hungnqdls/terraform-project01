variable "check_health" {
    type = map(string)
    default = {
        interval = "10"
        path     = "/"
        protocol = "HTTP"
        timeout  = "5"
        healthy_threshold = "5"
        unhealthy_threshold = "2"
    }
  
}
variable "env_name" {
    type = map(string)
    default = {
        alb_name = "ALB01"
    }
}
variable "http_ports" {
    type = number
    default = 80
}
variable "tg_type" {
    type = string
    default = "instance"
}
variable "internals" {
    type = bool
    default = false
}
variable "ip_type" {
    type = string
    default = "ipv4"
  
}
variable "lb_type" {
    type = string
    default = "application"
  
}
variable "vpc-id" {
}
variable "instance1_id" {
}
variable "instance2_id" {
}
variable "pub_subnet1" {
}
variable "pub_subnet2" {
}
variable "sg_name" {
  type = string
  default = "Application Load Balancer Security Group"
}
variable "public_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
variable "ingress_alb" {
  type = map(string)
  default = {
      http = "80"
      https = "443"
      protocol = "tcp"
  }
  
}