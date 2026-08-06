resource "kubernetes_service_account" "app" {

  metadata {
    name      = var.app_name
    namespace = var.project_name

    labels = {
      app = var.app_name
    }
  }

  image_pull_secret {
    name = "ghcr-secret"
  }
}