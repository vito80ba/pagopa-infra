# gps-app

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | = 1.3.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | = 2.21.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 3.45.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | = 2.5.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | = 2.11.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | = 3.1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apim_aca_integration_product"></a> [apim\_aca\_integration\_product](#module\_apim\_aca\_integration\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_api_debt_positions_api_v1"></a> [apim\_api\_debt\_positions\_api\_v1](#module\_apim\_api\_debt\_positions\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3//api_management_api | v6.11.2 |
| <a name="module_apim_api_gpd_api"></a> [apim\_api\_gpd\_api](#module\_apim\_api\_gpd\_api) | git::https://github.com/pagopa/terraform-azurerm-v3//api_management_api | v6.11.2 |
| <a name="module_apim_api_gpd_enrollment_api_v1"></a> [apim\_api\_gpd\_enrollment\_api\_v1](#module\_apim\_api\_gpd\_enrollment\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_gpd_payments_rest_external_api_v1"></a> [apim\_api\_gpd\_payments\_rest\_external\_api\_v1](#module\_apim\_api\_gpd\_payments\_rest\_external\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_gpd_reporting_analysis_api"></a> [apim\_api\_gpd\_reporting\_analysis\_api](#module\_apim\_api\_gpd\_reporting\_analysis\_api) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_gps_api_v1"></a> [apim\_api\_gps\_api\_v1](#module\_apim\_api\_gps\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_gps_donation_api_v1"></a> [apim\_api\_gps\_donation\_api\_v1](#module\_apim\_api\_gps\_donation\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_gps_enrollments_api_v1"></a> [apim\_api\_gps\_enrollments\_api\_v1](#module\_apim\_api\_gps\_enrollments\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_pn_integration_gpd_api_v1"></a> [apim\_api\_pn\_integration\_gpd\_api\_v1](#module\_apim\_api\_pn\_integration\_gpd\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_debt_positions_product"></a> [apim\_debt\_positions\_product](#module\_apim\_debt\_positions\_product) | git::https://github.com/pagopa/terraform-azurerm-v3//api_management_product | v6.11.2 |
| <a name="module_apim_gpd_enrollment_product"></a> [apim\_gpd\_enrollment\_product](#module\_apim\_gpd\_enrollment\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_gpd_integration_product"></a> [apim\_gpd\_integration\_product](#module\_apim\_gpd\_integration\_product) | git::https://github.com/pagopa/terraform-azurerm-v3//api_management_product | v6.11.2 |
| <a name="module_apim_gpd_payments_rest_external_product"></a> [apim\_gpd\_payments\_rest\_external\_product](#module\_apim\_gpd\_payments\_rest\_external\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_gpd_payments_soap_product"></a> [apim\_gpd\_payments\_soap\_product](#module\_apim\_gpd\_payments\_soap\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_gpd_product"></a> [apim\_gpd\_product](#module\_apim\_gpd\_product) | git::https://github.com/pagopa/terraform-azurerm-v3//api_management_product | v6.11.2 |
| <a name="module_apim_gpd_reporting_analysis_product"></a> [apim\_gpd\_reporting\_analysis\_product](#module\_apim\_gpd\_reporting\_analysis\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_gps_donation_product"></a> [apim\_gps\_donation\_product](#module\_apim\_gps\_donation\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_gps_enrollments_product"></a> [apim\_gps\_enrollments\_product](#module\_apim\_gps\_enrollments\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_gps_product"></a> [apim\_gps\_product](#module\_apim\_gps\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_pn_integration_product"></a> [apim\_pn\_integration\_product](#module\_apim\_pn\_integration\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_pod_identity"></a> [pod\_identity](#module\_pod\_identity) | git::https://github.com/pagopa/terraform-azurerm-v3.git//kubernetes_pod_identity | v6.4.1 |
| <a name="module_reporting_analysis_function"></a> [reporting\_analysis\_function](#module\_reporting\_analysis\_function) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app | v6.9.0 |
| <a name="module_reporting_analysis_function_slot_staging"></a> [reporting\_analysis\_function\_slot\_staging](#module\_reporting\_analysis\_function\_slot\_staging) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app_slot | v6.9.0 |
| <a name="module_reporting_batch_function"></a> [reporting\_batch\_function](#module\_reporting\_batch\_function) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app | v6.9.0 |
| <a name="module_reporting_batch_function_slot_staging"></a> [reporting\_batch\_function\_slot\_staging](#module\_reporting\_batch\_function\_slot\_staging) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app_slot | v6.9.0 |
| <a name="module_reporting_function_snet"></a> [reporting\_function\_snet](#module\_reporting\_function\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v6.4.1 |
| <a name="module_reporting_service_function"></a> [reporting\_service\_function](#module\_reporting\_service\_function) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app | v6.9.0 |
| <a name="module_reporting_service_function_slot_staging"></a> [reporting\_service\_function\_slot\_staging](#module\_reporting\_service\_function\_slot\_staging) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app_slot | v6.9.0 |
| <a name="module_tls_checker"></a> [tls\_checker](#module\_tls\_checker) | git::https://github.com/pagopa/terraform-azurerm-v3.git//tls_checker | v6.7.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management_api.apim_api_gpd_payments_soap_api_v1](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api_diagnostic.apim_logs](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_diagnostic) | resource |
| [azurerm_api_management_api_version_set.api_debt_positions_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gpd_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gpd_enrollment_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gpd_payments_rest_external_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gpd_payments_soap_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gpd_reporting_analysis_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gps_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gps_donation_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_gps_enrollments_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_pn_integration_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_product_api.apim_api_gpd_payments_soap_product_api_v1](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_product_api) | resource |
| [azurerm_api_management_product_api.apim_api_gpd_payments_soap_product_nodo_api_v1](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/api_management_product_api) | resource |
| [azurerm_app_service_plan.gpd_reporting_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/app_service_plan) | resource |
| [azurerm_key_vault_secret.aks_apiserver_url](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.azure_devops_sa_cacrt](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.azure_devops_sa_token](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/key_vault_secret) | resource |
| [azurerm_monitor_autoscale_setting.reporting_function](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-core-external-availability-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-core-external-responsetime-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-core-internal-availability-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-core-internal-responsetime-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-payments-rest-availability-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-payments-rest-responsetime-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-payments-soap-availability-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.opex_pagopa-gpd-payments-soap-responsetime-upd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.reporting_nodo_chiedi_elenco_flussi_rendicontazione_error](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.reporting_nodo_chiedi_flusso_rendicontazione_error](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.reporting_update_option_error](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_resource_group.gpd_rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/resources/resource_group) | resource |
| [helm_release.cert_mounter](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [helm_release.reloader](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.namespace_system](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/namespace) | resource |
| [kubernetes_role_binding.deployer_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/role_binding) | resource |
| [kubernetes_role_binding.system_deployer_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/role_binding) | resource |
| [kubernetes_service_account.azure_devops](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/service_account) | resource |
| [azuread_group.adgroup_admin](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_developers](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_externals](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_security](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azurerm_api_management.apim](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/api_management) | data source |
| [azurerm_application_insights.application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/application_insights) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/client_config) | data source |
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/container_registry) | data source |
| [azurerm_key_vault.gps_kv](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.flows_sa_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.gpd_db_pwd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.gpd_db_usr](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.gpd_paa_pwd](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.monitor_notification_email](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.monitor_notification_slack_email](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/key_vault_secret) | data source |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_log_analytics_workspace.log_analytics](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_monitor_action_group.email](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/monitor_action_group) | data source |
| [azurerm_monitor_action_group.opsgenie](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/monitor_action_group) | data source |
| [azurerm_monitor_action_group.slack](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/monitor_action_group) | data source |
| [azurerm_postgresql_flexible_server.postgres_flexible_server_private](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/postgresql_flexible_server) | data source |
| [azurerm_postgresql_server.postgresql](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/postgresql_server) | data source |
| [azurerm_resource_group.monitor_rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.rg_api](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.apim_snet](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/subnet) | data source |
| [azurerm_subnet.canoneunico_function_snet](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/subnet) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/subscription) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/virtual_network) | data source |
| [kubernetes_secret.azure_devops_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apim_dns_zone_prefix"></a> [apim\_dns\_zone\_prefix](#input\_apim\_dns\_zone\_prefix) | The dns subdomain for apim. | `string` | `null` | no |
| <a name="input_apim_logger_resource_id"></a> [apim\_logger\_resource\_id](#input\_apim\_logger\_resource\_id) | Resource id for the APIM logger | `string` | `null` | no |
| <a name="input_cidr_subnet_gpd"></a> [cidr\_subnet\_gpd](#input\_cidr\_subnet\_gpd) | Address prefixes subnet gpd service | `list(string)` | `null` | no |
| <a name="input_cidr_subnet_reporting_functions"></a> [cidr\_subnet\_reporting\_functions](#input\_cidr\_subnet\_reporting\_functions) | Address prefixes subnet reporting\_common function | `list(string)` | `null` | no |
| <a name="input_cname_record_name"></a> [cname\_record\_name](#input\_cname\_record\_name) | n/a | `string` | n/a | yes |
| <a name="input_ddos_protection_plan"></a> [ddos\_protection\_plan](#input\_ddos\_protection\_plan) | Network | <pre>object({<br>    id     = string<br>    enable = bool<br>  })</pre> | `null` | no |
| <a name="input_dns_zone_internal_prefix"></a> [dns\_zone\_internal\_prefix](#input\_dns\_zone\_internal\_prefix) | The dns subdomain. | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | n/a | `string` | n/a | yes |
| <a name="input_external_domain"></a> [external\_domain](#input\_external\_domain) | Domain for delegation | `string` | `null` | no |
| <a name="input_fn_app_storage_account_info"></a> [fn\_app\_storage\_account\_info](#input\_fn\_app\_storage\_account\_info) | n/a | <pre>object({<br>    account_kind               = optional(string, "StorageV2")<br>    account_tier               = optional(string, "Standard")<br>    account_replication_type   = optional(string, "LRS")<br>    advanced_threat_protection = optional(bool, true)<br>    access_tier                = optional(string, "Hot")<br>  })</pre> | <pre>{<br>  "access_tier": "Hot",<br>  "account_kind": "StorageV2",<br>  "account_replication_type": "LRS",<br>  "account_tier": "Standard",<br>  "advanced_threat_protection": true<br>}</pre> | no |
| <a name="input_gpd_always_on"></a> [gpd\_always\_on](#input\_gpd\_always\_on) | Always on property | `bool` | `true` | no |
| <a name="input_gpd_autoscale_default"></a> [gpd\_autoscale\_default](#input\_gpd\_autoscale\_default) | The number of instances that are available for scaling if metrics are not available for evaluation. | `number` | `1` | no |
| <a name="input_gpd_autoscale_maximum"></a> [gpd\_autoscale\_maximum](#input\_gpd\_autoscale\_maximum) | The maximum number of instances for this resource. | `number` | `3` | no |
| <a name="input_gpd_autoscale_minimum"></a> [gpd\_autoscale\_minimum](#input\_gpd\_autoscale\_minimum) | The minimum number of instances for this resource. | `number` | `1` | no |
| <a name="input_gpd_cron_job_enable"></a> [gpd\_cron\_job\_enable](#input\_gpd\_cron\_job\_enable) | GPD cron job enable | `bool` | `false` | no |
| <a name="input_gpd_cron_schedule_expired_to"></a> [gpd\_cron\_schedule\_expired\_to](#input\_gpd\_cron\_schedule\_expired\_to) | GDP cron scheduling (NCRON example '*/55 * * * * *') | `string` | `null` | no |
| <a name="input_gpd_cron_schedule_valid_to"></a> [gpd\_cron\_schedule\_valid\_to](#input\_gpd\_cron\_schedule\_valid\_to) | GPD cron scheduling (NCRON example '*/35 * * * * *') | `string` | `null` | no |
| <a name="input_gpd_db_name"></a> [gpd\_db\_name](#input\_gpd\_db\_name) | Name of the DB to connect to | `string` | `"apd"` | no |
| <a name="input_gpd_dbms_port"></a> [gpd\_dbms\_port](#input\_gpd\_dbms\_port) | Port number of the DBMS | `number` | `5432` | no |
| <a name="input_gpd_max_retry_queuing"></a> [gpd\_max\_retry\_queuing](#input\_gpd\_max\_retry\_queuing) | Max retry queuing when the node calling fails. | `number` | `5` | no |
| <a name="input_gpd_paa_id_intermediario"></a> [gpd\_paa\_id\_intermediario](#input\_gpd\_paa\_id\_intermediario) | PagoPA Broker ID | `string` | `false` | no |
| <a name="input_gpd_paa_stazione_int"></a> [gpd\_paa\_stazione\_int](#input\_gpd\_paa\_stazione\_int) | PagoPA Station ID | `string` | `false` | no |
| <a name="input_gpd_plan_kind"></a> [gpd\_plan\_kind](#input\_gpd\_plan\_kind) | App service plan kind | `string` | `null` | no |
| <a name="input_gpd_plan_sku_size"></a> [gpd\_plan\_sku\_size](#input\_gpd\_plan\_sku\_size) | App service plan sku size | `string` | `null` | no |
| <a name="input_gpd_plan_sku_tier"></a> [gpd\_plan\_sku\_tier](#input\_gpd\_plan\_sku\_tier) | App service plan sku tier | `string` | `null` | no |
| <a name="input_gpd_queue_delay_sec"></a> [gpd\_queue\_delay\_sec](#input\_gpd\_queue\_delay\_sec) | The length of time during which the message will be invisible, starting when it is added to the queue. | `number` | `3600` | no |
| <a name="input_gpd_queue_retention_sec"></a> [gpd\_queue\_retention\_sec](#input\_gpd\_queue\_retention\_sec) | The maximum time to allow the message to be in the queue. | `number` | `86400` | no |
| <a name="input_gpd_reporting_schedule_batch"></a> [gpd\_reporting\_schedule\_batch](#input\_gpd\_reporting\_schedule\_batch) | Cron scheduling (NCRON example '*/45 * * * * *') | `string` | `"0 0 1 * * *"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | One of beta, prod01, prod02 | `string` | n/a | yes |
| <a name="input_k8s_kube_config_path_prefix"></a> [k8s\_kube\_config\_path\_prefix](#input\_k8s\_kube\_config\_path\_prefix) | n/a | `string` | `"~/.kube"` | no |
| <a name="input_location"></a> [location](#input\_location) | One of westeurope, northeurope | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | One of wue, neu | `string` | n/a | yes |
| <a name="input_location_string"></a> [location\_string](#input\_location\_string) | One of West Europe, North Europe | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Specifies the name of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | The name of the resource group in which the Log Analytics workspace is located in. | `string` | n/a | yes |
| <a name="input_monitor_resource_group_name"></a> [monitor\_resource\_group\_name](#input\_monitor\_resource\_group\_name) | Monitor resource group name | `string` | n/a | yes |
| <a name="input_pgbouncer_enabled"></a> [pgbouncer\_enabled](#input\_pgbouncer\_enabled) | Built-in connection pooling solution | `bool` | `false` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_reporting_analysis_dotnet_version"></a> [reporting\_analysis\_dotnet\_version](#input\_reporting\_analysis\_dotnet\_version) | n/a | `string` | `null` | no |
| <a name="input_reporting_analysis_function_always_on"></a> [reporting\_analysis\_function\_always\_on](#input\_reporting\_analysis\_function\_always\_on) | Always on property | `bool` | `false` | no |
| <a name="input_reporting_analysis_function_client_certificate_mode"></a> [reporting\_analysis\_function\_client\_certificate\_mode](#input\_reporting\_analysis\_function\_client\_certificate\_mode) | client\_certificate\_mode property | `string` | `"Required"` | no |
| <a name="input_reporting_analysis_image"></a> [reporting\_analysis\_image](#input\_reporting\_analysis\_image) | reporting\_analysis\_function docker image | `string` | `""` | no |
| <a name="input_reporting_batch_dotnet_version"></a> [reporting\_batch\_dotnet\_version](#input\_reporting\_batch\_dotnet\_version) | Function app Framework choice | `string` | `null` | no |
| <a name="input_reporting_batch_function_always_on"></a> [reporting\_batch\_function\_always\_on](#input\_reporting\_batch\_function\_always\_on) | Always on property | `bool` | `false` | no |
| <a name="input_reporting_batch_image"></a> [reporting\_batch\_image](#input\_reporting\_batch\_image) | reporting\_batch\_function docker image | `string` | `""` | no |
| <a name="input_reporting_function"></a> [reporting\_function](#input\_reporting\_function) | Enable reporting\_function | `bool` | n/a | yes |
| <a name="input_reporting_function_autoscale_default"></a> [reporting\_function\_autoscale\_default](#input\_reporting\_function\_autoscale\_default) | The number of instances that are available for scaling if metrics are not available for evaluation. | `number` | `5` | no |
| <a name="input_reporting_function_autoscale_maximum"></a> [reporting\_function\_autoscale\_maximum](#input\_reporting\_function\_autoscale\_maximum) | The maximum number of instances for this resource. | `number` | `10` | no |
| <a name="input_reporting_function_autoscale_minimum"></a> [reporting\_function\_autoscale\_minimum](#input\_reporting\_function\_autoscale\_minimum) | The minimum number of instances for this resource. | `number` | `1` | no |
| <a name="input_reporting_functions_app_sku"></a> [reporting\_functions\_app\_sku](#input\_reporting\_functions\_app\_sku) | Reporting functions app plan SKU | <pre>object({<br>    kind     = string<br>    sku_tier = string<br>    sku_size = string<br>  })</pre> | n/a | yes |
| <a name="input_reporting_service_dotnet_version"></a> [reporting\_service\_dotnet\_version](#input\_reporting\_service\_dotnet\_version) | n/a | `string` | `null` | no |
| <a name="input_reporting_service_function_always_on"></a> [reporting\_service\_function\_always\_on](#input\_reporting\_service\_function\_always\_on) | Always on property | `bool` | `false` | no |
| <a name="input_reporting_service_image"></a> [reporting\_service\_image](#input\_reporting\_service\_image) | reporting\_service\_function docker image | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "CreatedBy": "Terraform"<br>}</pre> | no |
| <a name="input_tls_cert_check_helm"></a> [tls\_cert\_check\_helm](#input\_tls\_cert\_check\_helm) | tls cert helm chart configuration | <pre>object({<br>    chart_version = string,<br>    image_name    = string,<br>    image_tag     = string<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
