resource "kubernetes_deployment" "app" {

  metadata {

    name = var.app_name

    namespace = kubernetes_namespace.project.metadata[0].name

    labels = {

      app = var.app_name

    }

  }


  spec {

    replicas = var.replicas


    selector {

      match_labels = {

        app = var.app_name

      }

    }


    template {

      metadata {

        labels = {

          app = var.app_name

        }

      }


      spec {

        service_account_name = kubernetes_service_account.app.metadata[0].name


        container {

          name = var.app_name


          image = var.image


          image_pull_policy = "Always"


          port {

            container_port = var.container_port

          }


          env_from {

            config_map_ref {

              name = kubernetes_config_map.config.metadata[0].name

            }

          }


          env_from {

            secret_ref {

              name = kubernetes_secret.secret.metadata[0].name

            }

          }


          resources {

            requests = {

              cpu = "100m"

              memory = "128Mi"

            }


            limits = {

              cpu = "500m"

              memory = "512Mi"

            }

          }


          readiness_probe {

            http_get {

              path = "/ready"

              port = var.container_port

            }


            initial_delay_seconds = 5

            period_seconds = 10

          }


          liveness_probe {

            http_get {

              path = "/health"

              port = var.container_port

            }


            initial_delay_seconds = 20

            period_seconds = 15

          }


          security_context {

            allow_privilege_escalation = false


            read_only_root_filesystem = false

          }

        }

      }

    }

  }

}