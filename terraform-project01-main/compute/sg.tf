resource "aws_security_group" "webapp" {
    vpc_id = var.vpc-id
    name   = var.sg_name["webapp_sg_name"]
    ingress {
      cidr_blocks = var.ssh_block_cidr
      description = var.ingress_des["ssh_allow"]
      from_port = var.port_list_tcp["SSH"]
      to_port = var.port_list_tcp["SSH"]
      protocol = var.port_list_tcp["protocol"]
    }
    ingress {
      cidr_blocks = var.public_block_cidr
      description = var.ingress_des["http_allow"]
      from_port   = var.port_list_tcp["HTTP"]
      to_port     = var.port_list_tcp["HTTP"]
      protocol    = var.port_list_tcp["protocol"]
    }
    ingress {
      cidr_blocks = var.public_block_cidr
      description = var.ingress_des["https_allow"]
      from_port   = var.port_list_tcp["HTTPS"]
      to_port     = var.port_list_tcp["HTTPS"]
      protocol    = var.port_list_tcp["protocol"]
    }
    egress {
      cidr_blocks = var.outgoing_cidr
      description = var.egress_des["ssh_allow"]
      from_port = var.port_list_tcp["SSH"]
      to_port   = var.port_list_tcp["SSH"]
      protocol  = var.port_list_tcp["protocol"]
    }
    egress {
      cidr_blocks = var.outgoing_cidr
      description = var.egress_des["http_allow"]
      from_port   = var.port_list_tcp["HTTP"]
      to_port     = var.port_list_tcp["HTTP"]
      protocol    = var.port_list_tcp["protocol"]
    }
    egress {
      cidr_blocks = var.outgoing_cidr
      description = var.egress_des["https_allow"]
      from_port   = var.port_list_tcp["HTTPS"]
      to_port     = var.port_list_tcp["HTTPS"]
      protocol    = var.port_list_tcp["protocol"]
    }
    egress {
      cidr_blocks = var.outgoing_cidr
      description = var.egress_des["mysql_allow"]
      from_port   = var.port_list_tcp["MYSQL"]
      to_port     = var.port_list_tcp["MYSQL"]
      protocol    = var.port_list_tcp["protocol"]
    }
}
resource "aws_security_group" "database" {
    vpc_id = var.vpc-id
    name   = var.sg_name["database_sg_name"]
    ingress {
      cidr_blocks = var.private_block_cidr
      description = var.ingress_des["mysql_allow"]
      from_port   = var.port_list_tcp["MYSQL"]
      to_port     = var.port_list_tcp["MYSQL"]
      protocol    = var.port_list_tcp["protocol"]
    }
}
resource "aws_security_group" "bastion" {
  vpc_id = var.vpc-id
  name   = var.sg_name["bastion_sg_name"]
  ingress {
    cidr_blocks = var.ssh_block_cidr
    description = var.ingress_des["ssh_allow"]
    from_port  = var.port_list_tcp["SSH"]
    to_port = var.port_list_tcp["SSH"]
    protocol = var.port_list_tcp["protocol"]
  }
  egress {
    cidr_blocks = var.outgoing_cidr
    description = var.ingress_des["ssh_allow"]
    from_port   = var.port_list_tcp["SSH"]
    to_port     = var.port_list_tcp["SSH"]
    protocol    = var.port_list_tcp["protocol"]
  }
}
resource "aws_security_group" "alb" {
  vpc_id = var.vpc-id
  name = var.sg_name["alb_sg_name"]
  ingress {
  cidr_blocks = var.public_block_cidr
  description = var.ingress_des["http_allow"]
  from_port = var.port_list_tcp["HTTP"]
  to_port = var.port_list_tcp["HTTP"]
  protocol = var.port_list_tcp["protocol"]
  }
  ingress {
    cidr_blocks = var.public_block_cidr
    description = var.ingress_des["https_allow"]
    from_port = var.port_list_tcp["HTTPS"]
    to_port = var.port_list_tcp["HTTPS"]
    protocol = var.port_list_tcp["protocol"]
  }
}
