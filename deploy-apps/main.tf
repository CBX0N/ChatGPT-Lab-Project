resource "helm_release" "argocd" {
  name             = "argo-cd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  create_namespace = true
  cleanup_on_fail  = true
  version          = "7.6.12"

  set {
    name  = "secret.argocdServerAdminPassword"
    value = "y0Pom7GeppeeevKUh6l5mN1L/E9mh05vkrZoNAZwFy"
  }
}

