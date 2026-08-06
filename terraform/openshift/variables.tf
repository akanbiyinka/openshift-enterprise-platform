variable "project_name" {
  description = "OpenShift project namespace name"
  type        = string
  default     = "openshift-enterprise-platform"
}


variable "namespace" {
  description = "Kubernetes/OpenShift namespace"
  type        = string
  default     = "openshift-enterprise-platform"
}


variable "app_name" {
  description = "Application name"
  type        = string
  default     = "openshift-app"
}


variable "image" {
  description = "Container image"
  type        = string
  default     = "ghcr.io/akanbiyinka/openshift-enterprise-platform:latest"
}


variable "replicas" {
  description = "Number of application replicas"
  type        = number
  default     = 2
}


variable "container_port" {
  description = "Application container port"
  type        = number
  default     = 8080
}


variable "service_port" {
  description = "Kubernetes service port"
  type        = number
  default     = 80
}


variable "cpu_request" {
  description = "CPU request"
  type        = string
  default     = "100m"
}


variable "memory_request" {
  description = "Memory request"
  type        = string
  default     = "128Mi"
}


variable "cpu_limit" {
  description = "CPU limit"
  type        = string
  default     = "500m"
}


variable "memory_limit" {
  description = "Memory limit"
  type        = string
  default     = "512Mi"
}