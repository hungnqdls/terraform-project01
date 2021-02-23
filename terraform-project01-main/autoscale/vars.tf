variable "vpc-id" {
}
variable "pub_subnet1" {
}
variable "pub_subnet2" {
}
variable "alb_dns_name" {
}
variable "alb_target_group_arn" {
}
variable "type_instance" {
    type = string
    default = "t2.micro"
}
variable "webapp_sg" {
}
variable "type_healthcheck" {
    type = string
    default = "ELB"
}
variable "size_count" {
    type = map(number)
    default = {
        min = 2
        max = 8
    }
  
}
