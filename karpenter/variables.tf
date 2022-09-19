variable "cluster_name" {
  type        = string
}

variable "worker_iam_role_name" {
  type        = string
}

variable "eks_endpoint" {
  type        = string
}

variable "oidc_issuer" {
  type        = string
}

variable "karpenter_namespace" {
  description = "The Kubernetes namespace for Karpenter deployment"
  type        = string
  default     = "karpenter"
}