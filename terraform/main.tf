terraform {    
  required_providers {    
    azurerm = {    
      source = "hashicorp/azurerm"    
    }    
  }    
} 
   
provider "azurerm" {    
  features {}    
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.appsvcplanname
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = var.serviceplan_os_type
  sku_name            = var.serviceplan_sku
}

resource "azurerm_windows_web_app" "app_service" {
  name                = var.appservicename
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = false
    application_stack {
      current_stack   = "dotnet"
      dotnet_version  = var.dotnet_version
    }
  }



}