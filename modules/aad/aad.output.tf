##################
# Azure AD Group #
##################
# output aad group object id
output "aad_group_object_id" {
  value = azuread_group.aad_group.object_id
}
