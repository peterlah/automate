variable "prefix" {
  description = "The prefix of the resource"
  type        = string
  default     = "peterlah"
}

variable "service_name" {
  description = "The name of the service"
  type        = string
  default     = "automation"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "koreacentral"
}

variable "tags" {
  description = "The tags of the resource group"
  type        = map(string)
  default = {
    name = "peterlah"
  }
}

variable "admin_username" {
  description = "The admin username of the VM"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "The admin password of the VM"
  type        = string
  sensitive   = true
}
