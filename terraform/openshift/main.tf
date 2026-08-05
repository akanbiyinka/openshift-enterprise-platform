resource "kubernetes_namespace" "project" {

  metadata {

    name = var.project_name

    labels = {
      app = var.app_name
    }

  }

}


resource "kubernetes_service_account" "app" {

  metadata {

    name = var.app_name

    namespace = kubernetes_namespace.project.metadata[0].name

  }

}


resource "kubernetes_config_map" "config" {

  metadata {

    name = "${var.app_name}-config"

    namespace = kubernetes_namespace.project.metadata[0].name

  }


  data = {

    APP_NAME = "OpenShift Enterprise Platform"

    APP_VERSION = "1.0.0"

  }

}


resource "kubernetes_secret" "secret" {

  metadata {

    name = "${var.app_name}-secret"

    namespace = kubernetes_namespace.project.metadata[0].name

  }


  type = "Opaque"


  data = {

    API_KEY = base64encode("change-me")

  }

}


resource "kubernetes_service" "app" {

  metadata {

    name = var.app_name

    namespace = kubernetes_namespace.project.metadata[0].name

  }


  spec {

    selector = {

      app = var.app_name

    }


    port {

      port = 80

      target_port = var.container_port

    }

  }

}