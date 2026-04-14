variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "key_vault_names" {
  type = map(string)
}
variable "storage_account_name" {
  type = string
}

variable "vm_name"{
  type = string
}

variable "nic_id"{
  type = string
}