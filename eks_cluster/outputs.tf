output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "eks_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}

output "worker_iam_role_name" {
  value = aws_iam_role.node.name
}

output "oidc_issuer" {
  value = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

