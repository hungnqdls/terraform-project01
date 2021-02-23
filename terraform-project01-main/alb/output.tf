output "alb_dns_name" {
    value = aws_lb.alb01.dns_name
}
output "alb_target_group_arn" {
    value = aws_lb_target_group.tg01.arn
}