resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "kubernetes_secret_v1" "prometheus_basic_auth" {
  metadata {
    name      = "prometheus-basic-auth"
    namespace = "elastic-system"
  }

  data = {
    "auth" = "${file("${var.prometheus_basic_auth_file}")}"
  }

}

resource "helm_release" "kube_prometheus_stack" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = var.kube_prometheus_stack_helm.chart_version
  namespace  = "elastic-system" #kubernetes_namespace.monitoring.metadata[0].name

  values = [
    "${file("${var.kube_prometheus_stack_helm.values_file}")}"
  ]

}

resource "helm_release" "monitoring_reloader" {
  name       = "reloader"
  repository = "https://stakater.github.io/stakater-charts"
  chart      = "reloader"
  version    = var.reloader_helm.chart_version
  namespace  = kubernetes_namespace.monitoring.metadata[0].name

  set {
    name  = "reloader.watchGlobally"
    value = "false"
  }
  set {
    name  = "reloader.deployment.image.name"
    value = var.reloader_helm.image_name
  }
  set {
    name  = "reloader.deployment.image.tag"
    value = var.reloader_helm.image_tag
  }
}
