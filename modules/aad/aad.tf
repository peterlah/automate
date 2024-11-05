##################
# Azure AD Group #
##################
# create admin group
resource "azuread_group" "aad_group" {
  display_name     = var.display_name
  security_enabled = true
}
