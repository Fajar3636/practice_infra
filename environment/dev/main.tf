module "rg" {
    source = "../../module/azurerm_resource_group"
    rg = var.rg
  
}

module "stg" {
    source = "../../module/azurerm_stroge_account"
    stg = var.stg
    depends_on = [ module.rg ]
  
}

module "vnet" {
    source = "../../module/azurerm_virtul_network"
    depends_on = [ module.rg ]
    vnet = var.vnet
  
}

module "publicip" {
    source = "../../module/azurerm_public_ip"
    publicip = var.publicip
  
}