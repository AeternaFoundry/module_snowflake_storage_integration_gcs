resource "snowflake_storage_integration_gcs" "storage_integration_gcs" {
  for_each = var.storage_integration_gcs

  enabled                   = each.value.enabled
  name                      = each.value.name
  storage_allowed_locations = each.value.storage_allowed_locations
  comment                   = each.value.comment
  storage_blocked_locations = each.value.storage_blocked_locations

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

