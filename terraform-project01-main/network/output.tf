output "vpc-id" {
    value = aws_vpc.project01-vpc.id
}
output "public-subnets" {
    value = aws_subnet.project01-public-subnet.*.id
}
output "private-subnets" {
    value = aws_subnet.project01-private-subnet.*.id
}
output "pub_subnet1" {
    value = element(aws_subnet.project01-public-subnet.*.id ,0)
}
output "pub_subnet2" {
    value = element(aws_subnet.project01-public-subnet.*.id ,1)
}
output "priv_subnet1" {
    value = element(aws_subnet.project01-private-subnet.*.id ,0)
}
output "priv_subnet2" {
    value = element(aws_subnet.project01-private-subnet.*.id ,1)
}
