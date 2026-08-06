resource "kubernetes_ingress_v1" "app" {

  metadata {

    name = var.app_name

    namespace = kubernetes_namespace.project.metadata[0].name


    annotations = {

      "nginx.ingress.kubernetes.io/rewrite-target" = "/"

    }

  }


  spec {


    rule {


      http {


        path {


          path = "/"


          path_type = "Prefix"


          backend {


            service {


              name = kubernetes_service.app.metadata[0].name


              port {


                number = 80


              }


            }


          }


        }


      }


    }


  }

}