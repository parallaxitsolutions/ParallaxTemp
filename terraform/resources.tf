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

variable "rgname" {
  type = string
  default = "aptitude_test_rg"
}

variable "appsvcplanname" {
  type = string
  default = "aptitude_test_plan"
}

variable "location" {
  type = string
  default = "UK South"
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.appsvcplanname
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_windows_web_app" "app_service" {
  name                = "parallaxtestapp-2611"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = false
    application_stack {
      dotnet_version  = "v7.0"
    }
  }



}