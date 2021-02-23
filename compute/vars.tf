variable "priv_subnets" {
}
variable "pub_subnets" {
}
variable "vpc-id" {
}
variable "pub_subnet1" {
}
variable "pub_subnet2" {
}
variable "priv_subnet1" {
}
variable "priv_subnet2" {
}
variable "instance_count" {
    default = "2"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "type_volume" {
    type = map(string)
    default = {
        webapp = "gp2"
        bastion = "gp2"
    }
}
variable "size_volume" {
    type = map(number)
    default = {
        webapp = "8"
        bastion = "8"
    }
  
}
variable "volume_encrypted" {
    type = bool
    default = false
}
variable "keypairs_path" {
    type = map(string)
    default = {
        web_application = "compute/keypairs/web_app.pub"
        bastion_host    = "compute/keypairs/bastion.pub"
    }
}
variable "env_name" {
    type = map(string)
    default = {
        project_name = "PROJECT01"
        webapp_instance_name = "WEB FRONT END"
        bastion_instance_name = "BASTION HOST"
        webapp_sg_name = "Security Group For Web Application"
        bastion_sg_name = "Security Group FOr Bastion Hosts"
        web_application_name = "Web Application Keypairs"
        bastion_host_name = "Bastion Host Keypairs"

    }
}
variable "sg_name" {
    type = map(string)
    default = {
        webapp_sg_name = "Security Group For Web Application"
        bastion_sg_name = "Security Group For Bastion Hosts"
        database_sg_name = "Security Group For RDS"
        alb_sg_name = "Security Group For Application Load Balancer"
    }
  
}
variable "ingress_des" {
    default = {
        ssh_allow = "Allow SSH protocol"
        http_allow = "Allow HTTP Protocol"
        https_allow = "Allow HTTPS Protocol"
        mysql_allow = "Allow MYSQL Connect Database"
    }
  
}
variable "egress_des" {
    type = map(string)
    default = {
       ssh_allow = "Allow SSH Outgoing"
       http_allow = "Allow HTTP Outgoing"
       https_allow = "Allow HTTPS Outgoing"
       mysql_allow = "Allow MYSQL Outgoing"
    }
  
}
variable "ssh_block_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}
variable "public_block_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}
variable "outgoing_cidr" {
    type = list
    default = ["0.0.0.0/0","10.10.10.0/24","10.10.20.0/24","10.10.30.0/24","10.10.40.0/24"]
}
variable "webapp_static_ip" {
    type = list
    default = ["10.10.10.10","10.10.30.10"]
}
variable "private_block_cidr" {
    type = list
    default = ["10.10.10.0/24","10.10.30.0/24"]
}
variable "port_list_tcp" {
    type = map(string)
    default = {
        SSH = "22"
        HTTP = "80"
        HTTPS = "443"
        ICMP = "-1"
        MYSQL = "3306"
        protocol = "tcp"
    }
}


