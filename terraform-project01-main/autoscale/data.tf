data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_ami" "amazon-linux-2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}
data "template_file" "web_config" {
  template = file("./autoscale/templates/userdata.tpl")
}