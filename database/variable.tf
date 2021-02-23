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
    default = "db.t2.medium"
}
variable "db_engine" {
    type = string 
    default = "mariadb"
}
variable "db_engine_version" {
    type = string
    default = "10.4.8"
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
        rds_subnet_name = "rds_subnet_group"
    }
}
variable "login_info" {
    type = map(string)
    default = {
        db_username = "admin"
        db_password = "test123456"
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
variable "backup_time" {
    type = string 
    default = "09:46-10:16"
  
}

variable "parameter_group_name " {
    type = string
    default = "default.mariadb10.4" 
}
