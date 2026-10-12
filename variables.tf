variable "storage_integration_gcs" {
  description = <<EOT
Map of storage_integration_gcs, attributes below
Required:
    - enabled
    - name
    - storage_allowed_locations
Optional:
    - comment
    - storage_blocked_locations
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    enabled                   = bool
    name                      = string
    storage_allowed_locations = set(string)
    comment                   = optional(string)
    storage_blocked_locations = optional(set(string))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
}

