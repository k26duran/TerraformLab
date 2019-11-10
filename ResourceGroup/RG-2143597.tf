provider "azurerm" {
}
resource "azurerm_resource_group" "rg" {
 name = "ConuTerraformLab"
 location = "eastus"
}