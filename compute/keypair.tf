resource "aws_key_pair" "bastion" {
  key_name   = var.env_name["bastion_host_name"]
  public_key = file(var.keypairs_path["bastion_host"])
}
resource "aws_key_pair" "web_app" {
  key_name   = var.env_name["web_application_name"]
  public_key = file(var.keypairs_path["web_application"])
}