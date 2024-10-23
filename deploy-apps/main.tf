resource "helm_release" "argocd" {
  name             = "argo-cd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  create_namespace = true
  cleanup_on_fail  = true
  version          = "7.6.12"

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_server_admin_password
  }
  set {
    name = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name = "configs.params.\"server.insecure\""
    value = "true"
  }
}

resource "argocd_account_token" "foo" {
  depends_on = [ helm_release.argocd ]
  account      = "foo"
  expires_in   = "168h" # expire in 7 days
  renew_before = "84h"  # renew when less than 3.5 days remain until expiry
}