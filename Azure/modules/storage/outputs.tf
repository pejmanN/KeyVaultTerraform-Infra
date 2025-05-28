output "storage_account_name" {
  value = azurerm_storage_account.terraform_state.name
}

output "storage_account_id" {
  value = azurerm_storage_account.terraform_state.id
}

output "container_name" {
  value = azurerm_storage_container.terraform_state.name
}

output "primary_access_key" {
  value     = azurerm_storage_account.terraform_state.primary_access_key
  sensitive = true
}

output "sas_url_query_string" {
  value     = data.azurerm_storage_account_sas.state.sas
  sensitive = true
} 