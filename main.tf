resource "google_sql_database_instance" "default" {
  name                 = var.instance_name
  master_instance_name = var.master_instance_name
  database_version     = var.instance_version
  project              = var.project

  dynamic "replica_configuration" {
    for_each = var.master_instance_name != null ? [1] : []
    content {
      connect_retry_interval    = var.replica_configuration__connect_retry_interval
      failover_target           = var.replica_configuration__failover_target
      master_heartbeat_period   = var.replica_configuration__master_heartbeat_period
      verify_server_certificate = var.replica_configuration__verify_server_certificate
    }
  }

  settings {
    activation_policy      = var.settings__activation_policy
    availability_type      = var.settings__availability_type
    crash_safe_replication = var.settings__crash_safe_replication
    disk_autoresize        = var.settings__disk_autoresize
    disk_autoresize_limit  = var.settings__disk_autoresize_limit
    disk_size              = var.settings__disk_size
    disk_type              = var.settings__disk_type
    pricing_plan           = var.settings__pricing_plan
    replication_type       = var.settings__replication_type
    tier                   = var.settings__tier

    location_preference {
      zone = var.settings__location_preference__zone
    }


    maintenance_window {
      day  = var.settings__maintenance_window__day
      hour = var.settings__maintenance_window__hour
    }

    backup_configuration {
      backup_retention_settings {
        retained_backups = var.backup_retention_settings__retained_backups
        retention_unit   = var.backup_retention_settings__retention_unit
      }

      binary_log_enabled             = var.backup_configuration__binary_log_enabled
      enabled                        = var.backup_configuration__enabled
      location                       = var.backup_configuration__location
      start_time                     = var.backup_configuration__start_time
      transaction_log_retention_days = var.backup_configuration__transaction_log_retention_days
    }

    dynamic "database_flags" {
      for_each = toset(var.db_flags)

      content {
        name  = database_flags.value.name
        value = database_flags.value.value
      }
    }

    ip_configuration {
      ipv4_enabled    = var.ip_configuration__ipv4_enabled    # don't give the db a public IPv4
      private_network = var.ip_configuration__private_network # the VPC where the db will be assigned a private IP
      require_ssl     = var.ip_configuration__require_ssl

      dynamic "authorized_networks" {
        for_each = toset(var.ip_configuration__authorized_network)

        content {
          name  = authorized_networks.value.name
          value = authorized_networks.value.value
        }
      }
    }
  }
}

# defining databases in the instance
resource "google_sql_database" "default" {
  for_each = toset(var.databases)

  name     = each.value
  instance = google_sql_database_instance.default.name
  project  = var.project
}

# defining users in the instance
resource "google_sql_user" "default" {
  for_each = toset(var.users)

  name     = each.value
  instance = google_sql_database_instance.default.name
}
