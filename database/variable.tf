variable "priv_subnet1" {
  
}
variable "priv_subnet2" {
  
}
variable "database_sg" {
  
}
variable "db_count" {
    type = number
    default = "1"
}
variable "db_instance" {
    type = string
    default = "t2.micro"
}
variable "db_engine" {
    type = string 
    default = "mariadb"
}
variable "db_engine_version" {
    type = number
    default = "10.1.14"
}
variable "db_multi_az" {
    type = bool
    default = true
}
variable "db_storage_type" {
    type = string
    default = "gp2"
}
variable "db_allocated_storage" {
    type = number
    default = "20"
}
variable "env_name" {
    type = map(string)
    default = {
        instance_name = "myrds01"
        rds_subnet_name = "RDS Subnet Group"
    }
}
variable "login_info" {
    type = map(string)
    default = {
        db_username = "null"
        db_password = "null"
    }
}
variable "apply_immediate" {
    type = bool
    default = true
}
variable "backup_retention" {
    type = number
    default = "10"
}
variable "backuptime" {
    type = string 
    default = "09:46-10:16"
  
}
