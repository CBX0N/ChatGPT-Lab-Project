resource "helm_release" "argocd" {
  name             = "argo-cd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  create_namespace = true
  cleanup_on_fail  = true
  version          = "7.6.12"

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = "$2a$10$dQlb1epH4xIDue7b08Qqnuyy5dLoSKOwwVRxpS0xAtpifbNGIOgSW"
  }
}

