# create a S1 service plan
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan
resource "azurerm_app_service_plan" "asp" {
  name                = "asp1"
  location            = var.LOCATION
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# create an app service
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service
resource "azurerm_app_service" "amethysteweb" {
  name                = "aspnetamethyste"
  location            = azurerm_app_service_plan.asp.location
  resource_group_name = azurerm_app_service_plan.asp.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  site_config {
    linux_fx_version = "DOCKER|amethystestor1.azurecr.io/amethystestor:latest"
  }
}

