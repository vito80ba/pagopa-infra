resource "helm_release" "kube_filebeat" {
  name       = "filebeat"
  repository = "https://helm.elastic.co"
  chart      = "filebeat"
  version    = "8.5.1"
  namespace  = "elastic-system" #kubernetes_namespace.monitoring.metadata[0].name

  values = [
    "${file("${var.kube_filebeat_helm.values_file}")}"
  ]
}
