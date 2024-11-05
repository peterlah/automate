########################
# User Defined Routing #
########################
# resource group name
variable "rg_name" {}

# location
variable "location" {}

# routing table name
variable "route_table_name" {}

# routing table name
variable "route_name" {}

# routing table name
variable "address_prefix" {
    default = "0.0.0.0/0"
}

# next hope type
variable "next_hope_type" {
    default = "VirtualAppliance"
}

# next hop internal ip address
variable "next_hop_in_ip_address" {}

# subnet id
variable "subnet_id" {}