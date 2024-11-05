############################
# Azure Container Registry #
############################
# create container registry
resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  resource_group_name           = var.rg_name
  location                      = var.location
  sku                           = var.acr_sku
  public_network_access_enabled = var.public_access_allow

  identity {
    type = var.identity_type
    identity_ids = [
      var.uami_id
    ]
  }
}
# ** 로그아날리틱스 연결 옵션이 없음.