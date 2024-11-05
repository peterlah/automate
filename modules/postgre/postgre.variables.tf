##############
# PostgreSQL #
##############
# postgresql name
variable "postgre_name" {
  default = "postgresqljyg0131"
}

variable "location" {}

variable "rg_name" {}

variable "pg_admin" {
    default = "adminuser"
}

variable "pg_pass" {
    default = "password@123"    
}




