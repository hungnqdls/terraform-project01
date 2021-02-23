variable "vpc_cidr" {
    type = string
    default = "10.10.0.0/16"
}
variable "public_subnet_cidr" {
    type = list
    default = ["10.10.10.0/24","10.10.30.0/24"]
}
variable "private_subnet_cidr" {
    type = list
    default = ["10.10.20.0/24","10.10.40.0/24"]
}
variable "subnet_count" {
    type = number
    default = "2"
}
variable "using_ipv6" {
    type = bool
    default = false
}
variable "enable_classiclink" {
   type = bool
   default = false
}
variable "enable_dns_hostname" {
    type = bool
    default = true
}
variable "enable_dns_support" {
    type = bool 
    default = true
}
variable "enable_map_public_ip" {
    type = bool
    default = true
}
variable "disable_map_public_ip" {
    type = bool
    default = false
}
variable "ins_tenancy" {
    type = string
    default = "default"
}
variable "env_name" {
    type = map(string)
    default = {
        project_name = "Project01"
        vpc_name = "VPC01"
        public_subnet_name = "PUBLIC-SUBNET"
        private_subnet_name = "PRIVATE-SUBNET"
        eip_natgw_name = "NATGW-EIP"
        internet_gateway_name = "InternetGW"
        nat_gateway_name = "NatGW"
        default_routetb_name = "MAIN ROUTE TABLE"
        private_routetb_name = "PRIVATE ROUTE TABLE"
    }
}
variable "rta_count" {
  type = number
  default = "2"
}
variable "default_route_cidr" {
    type = string
    default = "0.0.0.0/0"
}
