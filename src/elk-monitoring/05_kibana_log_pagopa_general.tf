#################################### [PAGOPA] ####################################
locals {
  pagopa_key    = "pagopa"
  pipeline_name = "pagopa_json_parser"

  pagopa_space = replace(trimsuffix(trimprefix(templatefile("${path.module}/${local.pagopa_key}/space.json", {
    name = "${local.pagopa_key}"
  }), "\""), "\""), "'", "'\\''")

  pagopa_data_view = replace(trimsuffix(trimprefix(templatefile("${path.module}/${local.pagopa_key}/data-view.json", {
    name = local.pagopa_key
  }), "\""), "\""), "'", "'\\''")

  pagopa_ingest_pipeline = replace(trimsuffix(trimprefix(file("${path.module}/${local.pagopa_key}/ingest-pipeline.json"), "\""), "\""), "'", "'\\''")

  pagopa_component_template_custom = replace(trimsuffix(trimprefix(templatefile("${path.module}/${local.pagopa_key}/logs-kubernetes.container_logs@custom.json", {
    name = local.pipeline_name
  }), "\""), "\""), "'", "'\\''")
}

## space
resource "null_resource" "pagopa_kibana_space" {
  depends_on = [module.elastic_stack]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     = <<EOT
      curl -k -X POST "${local.kibana_url}/api/spaces/space" \
      -H 'kbn-xsrf: true' \
      -H 'Content-Type: application/json' \
      -d '${local.pagopa_space}'
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "null_resource" "pagopa_ingest_pipeline" {
  depends_on = [null_resource.pagopa_kibana_space]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     = <<EOT
      curl -k -X PUT "${local.elastic_url}/_ingest/pipeline/${local.pipeline_name}" \
      -H 'kbn-xsrf: true' \
      -H 'Content-Type: application/json' \
      -d '${local.pagopa_ingest_pipeline}'
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "null_resource" "pagopa_component_template_custom" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     = <<EOT
      curl -k -X PUT "${local.elastic_url}/_component_template/logs-kubernetes.container_logs@custom" \
      -H 'kbn-xsrf: true' \
      -H 'Content-Type: application/json' \
      -d '${local.pagopa_component_template_custom}'
    EOT
    interpreter = ["/bin/bash", "-c"]
  }

}

resource "null_resource" "pagopa_data_stream_rollover" {
  depends_on = [null_resource.pagopa_component_template_custom]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     = <<EOT
      curl -k -X POST "${local.elastic_url}/logs-kubernetes.container_logs-default/_rollover/" \
      -H 'kbn-xsrf: true' \
      -H 'Content-Type: application/json'
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "null_resource" "pagopa_kibana_data_view" {
  depends_on = [null_resource.pagopa_kibana_space]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command     = <<EOT
      curl -k -X POST "${local.kibana_url}/s/${local.pagopa_key}/api/data_views/data_view" \
      -H 'kbn-xsrf: true' \
      -H 'Content-Type: application/json' \
      -d '${local.pagopa_data_view}'
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}
