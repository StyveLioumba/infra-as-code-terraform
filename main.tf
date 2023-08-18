
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.38.0"
    }
  }

  # backend "azurerm" {
    # resource_group_name  = "rg2"
    # storage_account_name = "remotestates"
    # container_name       = "tfstate"
    # key                  = "terraform.tfstate"
    #  } 
}

# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  skip_provider_registration = true
  features {
  }
}

# create a resource group
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.LOCATION
}




