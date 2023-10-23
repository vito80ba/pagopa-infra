locals {
  product = "${var.prefix}-${var.env_short}"
  project = "${var.prefix}-${var.env_short}-${var.location_short}-${var.domain}"

  monitor_appinsights_name        = "${local.product}-appinsights"
  monitor_action_group_slack_name = "SlackPagoPA"
  monitor_action_group_email_name = "PagoPA"

  ingress_hostname_prefix               = "${var.instance}.${var.domain}"
  internal_dns_zone_resource_group_name = "${local.product}-vnet-rg"

  vnet_core_name                = "${local.product}-vnet"
  vnet_core_resource_group_name = "${local.product}-vnet-rg"

  vnet_integration_name                = "${local.product}-vnet-integration"
  vnet_integration_resource_group_name = "${local.product}-vnet-rg"

  dns_forwarder_backup_name = "${local.product}-dns-forwarder-backup-vmss"

}

variable "prefix" {
  type = string
  validation {
    condition = (
      length(var.prefix) <= 6
    )
    error_message = "Max length is 6 chars."
  }
}

variable "env" {
  type = string
}

variable "env_short" {
  type = string
  validation {
    condition = (
      length(var.env_short) == 1
    )
    error_message = "Length must be 1 chars."
  }
}

variable "domain" {
  type = string
  validation {
    condition = (
      length(var.domain) <= 12
    )
    error_message = "Max length is 12 chars."
  }
}

variable "location" {
  type        = string
  description = "One of westeurope, northeurope"
}

variable "location_short" {
  type = string
  validation {
    condition = (
      length(var.location_short) == 3
    )
    error_message = "Length must be 3 chars."
  }
  description = "One of wue, neu"
}

variable "instance" {
  type        = string
  description = "One of beta, prod01, prod02"
}

variable "lock_enable" {
  type        = bool
  default     = false
  description = "Apply locks to block accedentaly deletions."
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}


### External resources

variable "monitor_resource_group_name" {
  type        = string
  description = "Monitor resource group name"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Log Analytics workspace is located in."
}

# DNS
variable "external_domain" {
  type        = string
  default     = "pagopa.it"
  description = "Domain for delegation"
}



variable "gh_pat_kv_secret_name" {
  type = string
  description = "GitHub PAT secret name"
  default = "bot-token-github"
}



variable "gh_runner_subnet_cidr" {
  type = string
  default = "10.1.252.0/23"
  description = ""
}

variable "gh_pat_repos" {
  type = list(string)
  default = ["pagopa-api-config"]
}
