// for db instances

variable "project" {
  type = string
}

variable "instance_name" {
  type        = string
  description = "database instance name"
}

variable "master_instance_name" {
  type    = string
  default = null
}

variable "replica_configuration__connect_retry_interval" {
  type    = number
  default = 0
}
variable "replica_configuration__failover_target" {
  type    = bool
  default = false
}
variable "replica_configuration__master_heartbeat_period" {
  type    = number
  default = 0
}
variable "replica_configuration__verify_server_certificate" {
  type    = bool
  default = false
}

variable "db_flags" {}

variable "settings__activation_policy" {
  type    = string
  default = "ALWAYS"
}

variable "settings__availability_type" {
  type    = string
  default = "ZONAL"
}

variable "settings__crash_safe_replication" {
  type    = bool
  default = false
}

variable "settings__disk_autoresize" {
  type    = bool
  default = true
}

variable "settings__disk_autoresize_limit" {
  type    = number
  default = 0
}

variable "settings__disk_size" {
  type    = number
  default = 15
}

variable "settings__disk_type" {
  type    = string
  default = "PD_HDD"
}

variable "settings__pricing_plan" {
  type    = string
  default = "PER_USE"
}

variable "settings__replication_type" {
  type    = string
  default = "SYNCHRONOUS"
}

variable "settings__tier" {
  type    = string
  default = "db-n1-standard-1"
}

variable "settings__location_preference__zone" {
  type    = string
  default = "us-east1-b"
}

variable "settings__maintenance_window__day" {
  type    = string
  default = 6
}

variable "settings__maintenance_window__hour" {
  type    = string
  default = 19
}

variable "backup_retention_settings__retained_backups" {
  type    = number
  default = 7
}

variable "backup_retention_settings__retention_unit" {
  type    = string
  default = "COUNT"
}

variable "backup_configuration__binary_log_enabled" {
  type    = bool
  default = true
}

variable "backup_configuration__enabled" {
  type    = bool
  default = true
}

variable "backup_configuration__location" {
  type    = string
  default = "US"
}

variable "backup_configuration__start_time" {
  type    = string
  default = "07:00"
}

variable "backup_configuration__transaction_log_retention_days" {
  type    = number
  default = 7
}

variable "ip_configuration__authorized_network" {
  default = []
}

variable "ip_configuration__ipv4_enabled" {
  type    = bool
  default = true
}

variable "ip_configuration__private_network" {
  type = string
}

variable "ip_configuration__require_ssl" {
  type    = bool
  default = false
}

// databases in the instance

variable "databases" {
  type    = list(string)
  default = []
}

// database users in the instance

variable "users" {
  type    = list(string)
  default = []
}
