variable "project_name" {

  description = "OpenShift project name"

  type = string

  default = "openshift-enterprise-platform"

}


variable "app_name" {

  description = "Application name"

  type = string

  default = "openshift-app"

}


variable "image" {

  description = "Container image"

  type = string

}


variable "replicas" {

  description = "Application replicas"

  type = number

  default = 2

}


variable "container_port" {

  type = number

  default = 8080

}