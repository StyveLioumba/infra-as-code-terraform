variable "LOCATION" {
  type        = string
  description = "The location/region where the resource group is created."
  default     = "westeurope"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."

  validation {
    condition     = length(var.resource_group_name) <= 90
    error_message = "The resource group name must be less than 90 characters long."
  }
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account."
}

variable "container_name" {
  type        = string
  description = "The name of the container."
}


