##################
# Azure Firewall #
##################
# create azure firewall policy
resource "azurerm_firewall_policy" "policy" {
  name                = var.firewall_name
  resource_group_name = var.rg_name
  location            = var.location
  dns {
    proxy_enabled = true
  }
}

resource "azurerm_firewall_policy_rule_collection_group" "default_pg" {

  depends_on = [
    azurerm_firewall_policy.policy
  ]

  firewall_policy_id = azurerm_firewall_policy.policy.id
  name               = var.policy_group_name
  priority           = 300
  network_rule_collection {
    action   = "Allow"
    name     = "allow-internet"
    priority = 302

    rule {
      destination_addresses = ["*"]
      destination_ports     = ["80", "443"]
      name                  = "allow-web"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
    }
  }
}

resource "azurerm_public_ip" "firewall" {
  name                = var.firewall_pip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# create AzureFirewall
resource "azurerm_firewall" "azure_firewall" {

  depends_on = [
    azurerm_public_ip.firewall,
    azurerm_firewall_policy.policy
  ]

  name                = var.azure_firewall_name
  resource_group_name = var.rg_name
  location            = var.location
  firewall_policy_id  = azurerm_firewall_policy.policy.id
  sku_name            = var.firewall_sku_name
  sku_tier            = var.firewall_sku_tier

  ip_configuration {
    name                 = azurerm_public_ip.firewall.name
    subnet_id            = var.snet_id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}

/*
resource "azurerm_firewall_policy_rule_collection_group" "policy_group" {
  name               = var.policy_group_name
  firewall_policy_id = azurerm_firewall_policy.policy.id
  priority           = 200

  application_rule_collection {
    name     = "aks_app_rules"
    priority = 205
    action   = "Allow"
    rule {
      name = "aks_service"
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses      = ["20.0.0.0/16", "30.0.0.0/16", "192.168.0.0/16"]
      destination_fqdn_tags = ["AzureKubernetesService"]
    }
  }

  network_rule_collection {
    name     = "aks_network_rules"
    priority = 201
    action   = "Allow"
    rule {
      name                  = "https"
      protocols             = ["TCP"]
      source_addresses      = ["20.0.0.0/16", "30.0.0.0/16", "192.168.0.0/16"]
      destination_addresses = ["*"]
      destination_ports     = ["443"]
    }
    rule {
      name                  = "dns"
      protocols             = ["UDP"]
      source_addresses      = ["20.0.0.0/16", "30.0.0.0/16", "192.168.0.0/16"]
      destination_addresses = ["*"]
      destination_ports     = ["53"]
    }
    rule {
      name                  = "time"
      protocols             = ["UDP"]
      source_addresses      = ["20.0.0.0/16", "30.0.0.0/16", "192.168.0.0/16"]
      destination_addresses = ["*"]
      destination_ports     = ["123"]
    }
    rule {
      name                  = "tunnel_udp"
      protocols             = ["UDP"]
      source_addresses      = ["20.0.0.0/16", "30.0.0.0/16", "192.168.0.0/16"]
      destination_addresses = ["*"]
      destination_ports     = ["1194"]
    }
    rule {
      name                  = "tunnel_tcp"
      protocols             = ["TCP"]
      source_addresses      = ["20.0.0.0/16", "30.0.0.0/16", "192.168.0.0/16"]
      destination_addresses = ["*"]
      destination_ports     = ["9000"]
    }
  }
}
*/