# nodo-app

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | = 1.3.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | = 2.30.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.30.0, <= 3.53.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | = 2.5.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | = 2.11.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | = 3.1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apim_api_mock_ec_api_replica_v1"></a> [apim\_api\_mock\_ec\_api\_replica\_v1](#module\_apim\_api\_mock\_ec\_api\_replica\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_ec_api_v1"></a> [apim\_api\_mock\_ec\_api\_v1](#module\_apim\_api\_mock\_ec\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_ec_secondary_api_replica_v1"></a> [apim\_api\_mock\_ec\_secondary\_api\_replica\_v1](#module\_apim\_api\_mock\_ec\_secondary\_api\_replica\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_ec_secondary_api_v1"></a> [apim\_api\_mock\_ec\_secondary\_api\_v1](#module\_apim\_api\_mock\_ec\_secondary\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_pm_api_v1"></a> [apim\_api\_mock\_pm\_api\_v1](#module\_apim\_api\_mock\_pm\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_psp_api_replica_v1"></a> [apim\_api\_mock\_psp\_api\_replica\_v1](#module\_apim\_api\_mock\_psp\_api\_replica\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_psp_api_v1"></a> [apim\_api\_mock\_psp\_api\_v1](#module\_apim\_api\_mock\_psp\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_psp_secondary_api_replica_v1"></a> [apim\_api\_mock\_psp\_secondary\_api\_replica\_v1](#module\_apim\_api\_mock\_psp\_secondary\_api\_replica\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_mock_psp_secondary_api_v1"></a> [apim\_api\_mock\_psp\_secondary\_api\_v1](#module\_apim\_api\_mock\_psp\_secondary\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_nododatamigration_api_v1"></a> [apim\_api\_nododatamigration\_api\_v1](#module\_apim\_api\_nododatamigration\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.6.0 |
| <a name="module_apim_api_prometheus_api_v1"></a> [apim\_api\_prometheus\_api\_v1](#module\_apim\_api\_prometheus\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_receipt_for_ndp_api_v1"></a> [apim\_api\_receipt\_for\_ndp\_api\_v1](#module\_apim\_api\_receipt\_for\_ndp\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_web_bo_api_v1"></a> [apim\_api\_web\_bo\_api\_v1](#module\_apim\_api\_web\_bo\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_wfesp_api_replica_v1"></a> [apim\_api\_wfesp\_api\_replica\_v1](#module\_apim\_api\_wfesp\_api\_replica\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_api_wfesp_api_v1"></a> [apim\_api\_wfesp\_api\_v1](#module\_apim\_api\_wfesp\_api\_v1) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_apim_for_node_product"></a> [apim\_apim\_for\_node\_product](#module\_apim\_apim\_for\_node\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v5.1.0 |
| <a name="module_apim_mock_ec_product"></a> [apim\_mock\_ec\_product](#module\_apim\_mock\_ec\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_ec_product_replica"></a> [apim\_mock\_ec\_product\_replica](#module\_apim\_mock\_ec\_product\_replica) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_ec_secondary_product"></a> [apim\_mock\_ec\_secondary\_product](#module\_apim\_mock\_ec\_secondary\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_ec_secondary_product_replica"></a> [apim\_mock\_ec\_secondary\_product\_replica](#module\_apim\_mock\_ec\_secondary\_product\_replica) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_pm_product"></a> [apim\_mock\_pm\_product](#module\_apim\_mock\_pm\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_psp_product"></a> [apim\_mock\_psp\_product](#module\_apim\_mock\_psp\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_psp_product_replica"></a> [apim\_mock\_psp\_product\_replica](#module\_apim\_mock\_psp\_product\_replica) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_psp_secondary_product"></a> [apim\_mock\_psp\_secondary\_product](#module\_apim\_mock\_psp\_secondary\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_mock_psp_secondary_product_replica"></a> [apim\_mock\_psp\_secondary\_product\_replica](#module\_apim\_mock\_psp\_secondary\_product\_replica) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_nodo_dei_pagamenti_product_ndp"></a> [apim\_nodo\_dei\_pagamenti\_product\_ndp](#module\_apim\_nodo\_dei\_pagamenti\_product\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_nodo_dei_pagamenti_product_replica_ndp"></a> [apim\_nodo\_dei\_pagamenti\_product\_replica\_ndp](#module\_apim\_nodo\_dei\_pagamenti\_product\_replica\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_nodo_monitoring_api_ndp"></a> [apim\_nodo\_monitoring\_api\_ndp](#module\_apim\_nodo\_monitoring\_api\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_nodo_monitoring_api_replica_ndp"></a> [apim\_nodo\_monitoring\_api\_replica\_ndp](#module\_apim\_nodo\_monitoring\_api\_replica\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_nodo_per_pm_api_v1_ndp"></a> [apim\_nodo\_per\_pm\_api\_v1\_ndp](#module\_apim\_nodo\_per\_pm\_api\_v1\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_nodo_per_pm_api_v1_replica_ndp"></a> [apim\_nodo\_per\_pm\_api\_v1\_replica\_ndp](#module\_apim\_nodo\_per\_pm\_api\_v1\_replica\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_nodo_per_pm_api_v2_ndp"></a> [apim\_nodo\_per\_pm\_api\_v2\_ndp](#module\_apim\_nodo\_per\_pm\_api\_v2\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_nodo_per_pm_api_v2_replica_ndp"></a> [apim\_nodo\_per\_pm\_api\_v2\_replica\_ndp](#module\_apim\_nodo\_per\_pm\_api\_v2\_replica\_ndp) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api | v6.4.1 |
| <a name="module_apim_nododatamigration_product"></a> [apim\_nododatamigration\_product](#module\_apim\_nododatamigration\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.6.0 |
| <a name="module_apim_prometheus_product"></a> [apim\_prometheus\_product](#module\_apim\_prometheus\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_receipt_for_ndp_product"></a> [apim\_receipt\_for\_ndp\_product](#module\_apim\_receipt\_for\_ndp\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_web_bo_product"></a> [apim\_web\_bo\_product](#module\_apim\_web\_bo\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_wfesp_product"></a> [apim\_wfesp\_product](#module\_apim\_wfesp\_product) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_apim_wfesp_product_replica"></a> [apim\_wfesp\_product\_replica](#module\_apim\_wfesp\_product\_replica) | git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product | v6.4.1 |
| <a name="module_load_balancer_nodo_egress"></a> [load\_balancer\_nodo\_egress](#module\_load\_balancer\_nodo\_egress) | git::https://github.com/pagopa/terraform-azurerm-v3.git//load_balancer | v6.5.0 |
| <a name="module_nodo_re_to_datastore_function"></a> [nodo\_re\_to\_datastore\_function](#module\_nodo\_re\_to\_datastore\_function) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app | v6.20.0 |
| <a name="module_nodo_re_to_datastore_function_slot_staging"></a> [nodo\_re\_to\_datastore\_function\_slot\_staging](#module\_nodo\_re\_to\_datastore\_function\_slot\_staging) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app_slot | v6.9.0 |
| <a name="module_nodo_re_to_datastore_function_snet"></a> [nodo\_re\_to\_datastore\_function\_snet](#module\_nodo\_re\_to\_datastore\_function\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v6.4.1 |
| <a name="module_nodo_re_to_tablestorage_function"></a> [nodo\_re\_to\_tablestorage\_function](#module\_nodo\_re\_to\_tablestorage\_function) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app | v6.20.0 |
| <a name="module_nodo_re_to_tablestorage_function_slot_staging"></a> [nodo\_re\_to\_tablestorage\_function\_slot\_staging](#module\_nodo\_re\_to\_tablestorage\_function\_slot\_staging) | git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app_slot | v6.9.0 |
| <a name="module_nodo_re_to_tablestorage_function_snet"></a> [nodo\_re\_to\_tablestorage\_function\_snet](#module\_nodo\_re\_to\_tablestorage\_function\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v6.4.1 |
| <a name="module_pod_identity"></a> [pod\_identity](#module\_pod\_identity) | git::https://github.com/pagopa/terraform-azurerm-v3.git//kubernetes_pod_identity | v6.4.1 |
| <a name="module_route_table_peering_nexi"></a> [route\_table\_peering\_nexi](#module\_route\_table\_peering\_nexi) | git::https://github.com/pagopa/azurerm.git//route_table | v1.0.90 |
| <a name="module_tls_checker"></a> [tls\_checker](#module\_tls\_checker) | git::https://github.com/pagopa/terraform-azurerm-v3.git//tls_checker | v5.5.2 |
| <a name="module_vmss_snet"></a> [vmss\_snet](#module\_vmss\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v6.4.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management_api.apim_node_for_io_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_node_for_io_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_node_for_psp_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_node_for_psp_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_nodo_per_pa_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_nodo_per_pa_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_nodo_per_psp_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_nodo_per_psp_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_nodo_per_psp_richiesta_avvisi_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_nodo_per_psp_richiesta_avvisi_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_psp_for_node_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api.apim_psp_for_node_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api) | resource |
| [azurerm_api_management_api_operation_policy.close_payment_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy) | resource |
| [azurerm_api_management_api_operation_policy.close_payment_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy) | resource |
| [azurerm_api_management_api_operation_policy.nm3_activate_v2_verify_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy) | resource |
| [azurerm_api_management_api_operation_policy.nm3_activate_verify_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy) | resource |
| [azurerm_api_management_api_operation_policy.parked_list_api_v1_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy) | resource |
| [azurerm_api_management_api_operation_policy.parked_list_api_v1_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation_policy) | resource |
| [azurerm_api_management_api_policy.apim_node_for_io_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_node_for_io_policy_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_node_for_psp_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_node_for_psp_policy_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_nodo_per_pa_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_nodo_per_pa_policy_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_nodo_per_psp_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_nodo_per_psp_policy_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_nodo_per_psp_richiesta_avvisi_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_nodo_per_psp_richiesta_avvisi_policy_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_psp_for_node_policy_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_policy.apim_psp_for_node_policy_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_policy) | resource |
| [azurerm_api_management_api_version_set.api_datamigration_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_ec_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_ec_api_replica](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_ec_secondary_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_ec_secondary_api_replica](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_pm_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_psp_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_psp_api_replica](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_psp_secondary_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_mock_psp_secondary_api_replica](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_receipt_for_ndp_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_wfesp_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.api_wfesp_api_replica](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.node_for_io_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.node_for_io_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.node_for_psp_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.node_for_psp_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_monitoring_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_monitoring_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_pa_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_pa_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_pm_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_pm_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_psp_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_psp_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_psp_richiesta_avvisi_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.nodo_per_psp_richiesta_avvisi_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.psp_for_node_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_api_version_set.psp_for_node_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set) | resource |
| [azurerm_api_management_product_api.apim_nodo_dei_pagamenti_product_api_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api) | resource |
| [azurerm_api_management_product_api.apim_nodo_dei_pagamenti_product_api_replica_ndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api) | resource |
| [azurerm_key_vault_secret.aks_apiserver_url](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.azure_devops_sa_cacrt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.azure_devops_sa_token](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_kubernetes_cluster_node_pool.nodo_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_linux_virtual_machine_scale_set.vmss-egress](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_monitor_autoscale_setting.nodo_re_to_datastore_function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_monitor_autoscale_setting.nodo_re_to_tablestorage_function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_monitor_autoscale_setting.vmss-scale](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_monitor_metric_alert.aks_nodo_moetrics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.aks_nodo_moetrics_error](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.alert-fault-code-availability](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.alert-fault-code-specific-threshold](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.alert-nodo-auth-availability](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.alert-nodo-auth-responsetime](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.alert-nodo-availability](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.alert-nodo-responsetime](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_resource_group.nodo_re_to_datastore_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.vmss_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet_route_table_association.snet_vmss_to_sia](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_machine_scale_set_extension.vmss-extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_scale_set_extension) | resource |
| [helm_release.cert_mounter](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [helm_release.reloader](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.namespace_system](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/namespace) | resource |
| [kubernetes_role_binding.deployer_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/role_binding) | resource |
| [kubernetes_role_binding.deployer_binding_2](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/role_binding) | resource |
| [kubernetes_role_binding.system_deployer_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/role_binding) | resource |
| [kubernetes_role_binding.system_deployer_binding_2](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/role_binding) | resource |
| [kubernetes_service_account.azure_devops](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/service_account) | resource |
| [azuread_group.adgroup_admin](https://registry.terraform.io/providers/hashicorp/azuread/2.30.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_developers](https://registry.terraform.io/providers/hashicorp/azuread/2.30.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_externals](https://registry.terraform.io/providers/hashicorp/azuread/2.30.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_security](https://registry.terraform.io/providers/hashicorp/azuread/2.30.0/docs/data-sources/group) | data source |
| [azurerm_api_management.apim](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/api_management) | data source |
| [azurerm_api_management_group.group_developers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/api_management_group) | data source |
| [azurerm_application_insights.application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/application_insights) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/container_registry) | data source |
| [azurerm_cosmosdb_account.nodo_re_cosmosdb_nosql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/cosmosdb_account) | data source |
| [azurerm_cosmosdb_sql_database.nodo_re_cosmosdb_nosql_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/cosmosdb_sql_database) | data source |
| [azurerm_eventhub.pagopa-evh-ns01_nodo-dei-pagamenti-re_nodo-dei-pagamenti-re](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub) | data source |
| [azurerm_eventhub_authorization_rule.pagopa-evh-ns01_nodo-dei-pagamenti-re_nodo-dei-pagamenti-re-to-datastore-rx](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_authorization_rule) | data source |
| [azurerm_eventhub_authorization_rule.pagopa-evh-ns01_nodo-dei-pagamenti-re_nodo-dei-pagamenti-re-to-tablestorage-rx](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_authorization_rule) | data source |
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.client_id_swclient](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.client_secret_swclient](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.subscriptionkey_ecomm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.vmss_admin_login](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.vmss_admin_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_log_analytics_workspace.log_analytics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_monitor_action_group.email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |
| [azurerm_monitor_action_group.opsgenie](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |
| [azurerm_monitor_action_group.slack](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |
| [azurerm_monitor_action_group.slacknodo](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |
| [azurerm_resource_group.monitor_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_route_table.route_sia](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/route_table) | data source |
| [azurerm_storage_account.nodo_re_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subnet.aks_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subnet.apim_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.vnet_integration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [kubernetes_secret.azure_devops_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_cidr_subnet"></a> [aks\_cidr\_subnet](#input\_aks\_cidr\_subnet) | Aks network address space. | `list(string)` | n/a | yes |
| <a name="input_apim_dns_zone_prefix"></a> [apim\_dns\_zone\_prefix](#input\_apim\_dns\_zone\_prefix) | The dns subdomain for apim. | `string` | `null` | no |
| <a name="input_cidr_subnet_vmss"></a> [cidr\_subnet\_vmss](#input\_cidr\_subnet\_vmss) | VMSS network address space. | `list(string)` | n/a | yes |
| <a name="input_cname_record_name"></a> [cname\_record\_name](#input\_cname\_record\_name) | n/a | `string` | `"config"` | no |
| <a name="input_dns_zone_internal_prefix"></a> [dns\_zone\_internal\_prefix](#input\_dns\_zone\_internal\_prefix) | The dns subdomain. | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | n/a | `string` | n/a | yes |
| <a name="input_external_domain"></a> [external\_domain](#input\_external\_domain) | Domain for delegation | `string` | `null` | no |
| <a name="input_function_app_storage_account_replication_type"></a> [function\_app\_storage\_account\_replication\_type](#input\_function\_app\_storage\_account\_replication\_type) | (Optional) Storage account replication type used for function apps | `string` | `"ZRS"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | One of beta, prod01, prod02 | `string` | n/a | yes |
| <a name="input_k8s_kube_config_path_prefix"></a> [k8s\_kube\_config\_path\_prefix](#input\_k8s\_kube\_config\_path\_prefix) | n/a | `string` | `"~/.kube"` | no |
| <a name="input_lb_frontend_private_ip_address"></a> [lb\_frontend\_private\_ip\_address](#input\_lb\_frontend\_private\_ip\_address) | load balancer egress nodo private ip | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | One of westeurope, northeurope | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | One of wue, neu | `string` | n/a | yes |
| <a name="input_location_string"></a> [location\_string](#input\_location\_string) | One of West Europe, North Europe | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Specifies the name of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | The name of the resource group in which the Log Analytics workspace is located in. | `string` | n/a | yes |
| <a name="input_monitor_resource_group_name"></a> [monitor\_resource\_group\_name](#input\_monitor\_resource\_group\_name) | Monitor resource group name | `string` | n/a | yes |
| <a name="input_nodo_ndp_subscription_limit"></a> [nodo\_ndp\_subscription\_limit](#input\_nodo\_ndp\_subscription\_limit) | subscriptions limit | `number` | `1000` | no |
| <a name="input_nodo_re_to_datastore_function"></a> [nodo\_re\_to\_datastore\_function](#input\_nodo\_re\_to\_datastore\_function) | Nodo RE to datastore function | <pre>object({<br>    always_on                    = bool<br>    kind                         = string<br>    sku_size                     = string<br>    sku_tier                     = string<br>    maximum_elastic_worker_count = number<br>  })</pre> | <pre>{<br>  "always_on": true,<br>  "kind": "Linux",<br>  "maximum_elastic_worker_count": 1,<br>  "sku_size": "B1",<br>  "sku_tier": "Basic"<br>}</pre> | no |
| <a name="input_nodo_re_to_datastore_function_app_image_tag"></a> [nodo\_re\_to\_datastore\_function\_app\_image\_tag](#input\_nodo\_re\_to\_datastore\_function\_app\_image\_tag) | Nodo RE to Datastore function app docker image tag. Defaults to 'latest' | `string` | `"latest"` | no |
| <a name="input_nodo_re_to_datastore_function_autoscale"></a> [nodo\_re\_to\_datastore\_function\_autoscale](#input\_nodo\_re\_to\_datastore\_function\_autoscale) | Nodo RE functions autoscaling parameters | <pre>object({<br>    default = number<br>    minimum = number<br>    maximum = number<br>  })</pre> | n/a | yes |
| <a name="input_nodo_re_to_datastore_function_subnet"></a> [nodo\_re\_to\_datastore\_function\_subnet](#input\_nodo\_re\_to\_datastore\_function\_subnet) | Address prefixes subnet | `list(string)` | `null` | no |
| <a name="input_nodo_re_to_datastore_network_policies_enabled"></a> [nodo\_re\_to\_datastore\_network\_policies\_enabled](#input\_nodo\_re\_to\_datastore\_network\_policies\_enabled) | Network policies enabled | `bool` | `false` | no |
| <a name="input_nodo_re_to_tablestorage_function"></a> [nodo\_re\_to\_tablestorage\_function](#input\_nodo\_re\_to\_tablestorage\_function) | Nodo RE to datastore function | <pre>object({<br>    always_on                    = bool<br>    kind                         = string<br>    sku_size                     = string<br>    sku_tier                     = string<br>    maximum_elastic_worker_count = number<br>  })</pre> | n/a | yes |
| <a name="input_nodo_re_to_tablestorage_function_app_image_tag"></a> [nodo\_re\_to\_tablestorage\_function\_app\_image\_tag](#input\_nodo\_re\_to\_tablestorage\_function\_app\_image\_tag) | Nodo RE to Table Storage function app docker image tag. Defaults to 'latest' | `string` | `"latest"` | no |
| <a name="input_nodo_re_to_tablestorage_function_autoscale"></a> [nodo\_re\_to\_tablestorage\_function\_autoscale](#input\_nodo\_re\_to\_tablestorage\_function\_autoscale) | Nodo RE functions autoscaling parameters | <pre>object({<br>    default = number<br>    minimum = number<br>    maximum = number<br>  })</pre> | n/a | yes |
| <a name="input_nodo_re_to_tablestorage_function_subnet"></a> [nodo\_re\_to\_tablestorage\_function\_subnet](#input\_nodo\_re\_to\_tablestorage\_function\_subnet) | Address prefixes subnet | `list(string)` | `null` | no |
| <a name="input_nodo_re_to_tablestorage_network_policies_enabled"></a> [nodo\_re\_to\_tablestorage\_network\_policies\_enabled](#input\_nodo\_re\_to\_tablestorage\_network\_policies\_enabled) | Network policies enabled | `bool` | `false` | no |
| <a name="input_nodo_user_node_pool"></a> [nodo\_user\_node\_pool](#input\_nodo\_user\_node\_pool) | AKS node pool user configuration | <pre>object({<br>    enabled            = bool,<br>    name               = string,<br>    vm_size            = string,<br>    os_disk_type       = string,<br>    os_disk_size_gb    = string,<br>    node_count_min     = number,<br>    node_count_max     = number,<br>    node_labels        = map(any),<br>    node_taints        = list(string),<br>    node_tags          = map(any),<br>    nodo_pool_max_pods = number,<br>  })</pre> | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_route_aks"></a> [route\_aks](#input\_route\_aks) | AKS routing table | <pre>list(object({<br>    name                   = string<br>    address_prefix         = string<br>    next_hop_type          = string<br>    next_hop_in_ip_address = string<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "CreatedBy": "Terraform"<br>}</pre> | no |
| <a name="input_tls_cert_check_helm"></a> [tls\_cert\_check\_helm](#input\_tls\_cert\_check\_helm) | tls cert helm chart configuration | <pre>object({<br>    chart_version = string,<br>    image_name    = string,<br>    image_tag     = string<br>  })</pre> | n/a | yes |
| <a name="input_vmss_instance_number"></a> [vmss\_instance\_number](#input\_vmss\_instance\_number) | availability zones for vmss | `number` | n/a | yes |
| <a name="input_vmss_zones"></a> [vmss\_zones](#input\_vmss\_zones) | availability zones for vmss | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
