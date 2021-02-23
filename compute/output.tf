output "instance1_id" {
    value = element(aws_instance.webapp.*.id , 0)
}
output "instance2_id" {
    value = element(aws_instance.webapp.*.id , 1)
}
output "instances_id" {
    value = aws_instance.webapp.*.id
}
output "webapp_sg" {
    value = aws_security_group.webapp.id 
}
output "database_sg" {
    value = aws_security_group.database.id 
}
output "alb_sg" {
    value = aws_security_group.alb.id
}