resource "kubernetes_horizontal_pod_autoscaler_v2" "app" {


  metadata {

    name = var.app_name

    namespace = kubernetes_namespace.project.metadata[0].name

  }


  spec {

    min_replicas = 2

    max_replicas = 10


    scale_target_ref {

      api_version = "apps/v1"

      kind = "Deployment"

      name = kubernetes_deployment.app.metadata[0].name

    }


    metric {

      type = "Resource"


      resource {

        name = "cpu"


        target {

          type = "Utilization"

          average_utilization = 70

        }

      }

    }

  }

}