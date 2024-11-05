#######################
# Application Gateway #
#######################
# create application gateway
resource "azurerm_application_gateway" "agw" {
  name                = var.agw_name
  location            = var.location
  resource_group_name = var.rg_name
  
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = 2
  }
  
  gateway_ip_configuration {
    name      = var.private_ip_name
    subnet_id = var.subnet_id
  }
  
  frontend_port {
    name = var.frontend_port_name
    port = 80
  }
  
  frontend_ip_configuration {
    name                 = var.public_ip_address_name
    public_ip_address_id = var.public_ip_id
  }
  
  backend_address_pool {
    name = var.backendpool_name 
  }
  
  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = var.backend_http_settings_affinity 
    port                  = var.backend_http_settings_port 
    protocol              = var.backend_http_settings_protocol 
  }
  
  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.public_ip_address_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.http_listener_protocol 
  }
  
  request_routing_rule {
    name                       = "routing_rule"
    rule_type                  = "Basic"
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.backendpool_name
    backend_http_settings_name = var.backend_http_settings_name
    priority                   = 1
  }

  /* waf 설정
  waf_configuration {
    enabled                     = true
    firewall_mode               = "Prevention"
    rule_set_type               = "OWASP"
    rule_set_version            = "3.1"
    request_body_check          = true
    file_upload_limit_mb        = 100
    max_request_body_size_kb    = 128
  }
} */
}