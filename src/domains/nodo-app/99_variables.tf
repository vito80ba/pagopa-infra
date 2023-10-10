# general

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

variable "location_string" {
  type        = string
  description = "One of West Europe, North Europe"
}

variable "instance" {
  type        = string
  description = "One of beta, prod01, prod02"
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

### Aks

variable "k8s_kube_config_path_prefix" {
  type    = string
  default = "~/.kube"
}

variable "external_domain" {
  type        = string
  default     = null
  description = "Domain for delegation"
}

variable "dns_zone_internal_prefix" {
  type        = string
  default     = null
  description = "The dns subdomain."
}

variable "apim_dns_zone_prefix" {
  type        = string
  default     = null
  description = "The dns subdomain for apim."
}

variable "tls_cert_check_helm" {
  type = object({
    chart_version = string,
    image_name    = string,
    image_tag     = string
  })
  description = "tls cert helm chart configuration"
}
variable "nodo_user_node_pool" {
  type = object({
    enabled            = bool,
    name               = string,
    vm_size            = string,
    os_disk_type       = string,
    os_disk_size_gb    = string,
    node_count_min     = number,
    node_count_max     = number,
    node_labels        = map(any),
    node_taints        = list(string),
    node_tags          = map(any),
    nodo_pool_max_pods = number,
  })
  description = "AKS node pool user configuration"
}

variable "aks_cidr_subnet" {
  type        = list(string)
  description = "Aks network address space."
}

variable "cidr_subnet_vmss" {
  type        = list(string)
  description = "VMSS network address space."
}

variable "cname_record_name" {
  type    = string
  default = "config"
}

# nodo dei pagamenti - ndp
variable "nodo_ndp_subscription_limit" {
  type        = number
  description = "subscriptions limit"
  default     = 1000
}

variable "lb_frontend_private_ip_address" {
  type        = string
  description = "load balancer egress nodo private ip"
}

variable "route_aks" {
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))
  description = "AKS routing table"
}

variable "vmss_zones" {
  type        = list(string)
  description = "availability zones for vmss "
}

variable "vmss_instance_number" {
  type        = number
  description = "availability zones for vmss "
}

variable "nodo_re_to_datastore_function" {
  type = object({
    always_on                    = bool
    kind                         = string
    sku_size                     = string
    sku_tier                     = string
    maximum_elastic_worker_count = number
  })
  description = "Nodo RE to datastore function"
  default = {
    always_on                    = true
    kind                         = "Linux"
    sku_size                     = "B1"
    sku_tier                     = "Basic"
    maximum_elastic_worker_count = 1
  }
}

variable "nodo_re_to_datastore_function_subnet" {
  type        = list(string)
  description = "Address prefixes subnet"
  default     = null
}

variable "nodo_re_to_datastore_network_policies_enabled" {
  type        = bool
  description = "Network policies enabled"
  default     = false
}

variable "nodo_re_to_datastore_function_app_image_tag" {
  type        = string
  default     = "latest"
  description = "Nodo RE to Datastore function app docker image tag. Defaults to 'latest'"
}

variable "nodo_re_to_datastore_function_autoscale" {
  type = object({
    default = number
    minimum = number
    maximum = number
  })
  description = "Nodo RE functions autoscaling parameters"
}

variable "nodo_re_to_tablestorage_function" {
  type = object({
    always_on                    = bool
    kind                         = string
    sku_size                     = string
    sku_tier                     = string
    maximum_elastic_worker_count = number
  })
  description = "Nodo RE to datastore function"
}

variable "nodo_re_to_tablestorage_function_subnet" {
  type        = list(string)
  description = "Address prefixes subnet"
  default     = null
}

variable "nodo_re_to_tablestorage_network_policies_enabled" {
  type        = bool
  description = "Network policies enabled"
  default     = false
}

variable "nodo_re_to_tablestorage_function_app_image_tag" {
  type        = string
  default     = "latest"
  description = "Nodo RE to Table Storage function app docker image tag. Defaults to 'latest'"
}

variable "nodo_re_to_tablestorage_function_autoscale" {
  type = object({
    default = number
    minimum = number
    maximum = number
  })
  description = "Nodo RE functions autoscaling parameters"
}


variable "app_service_storage_account_replication_type" {
  type = string
  default = "ZRS"
  description = "(Optional) Storage account replication type used for function apps"
}
