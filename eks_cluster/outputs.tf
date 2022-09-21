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

output "cluster_oidc_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}

output "cluster_oidc_url" {
  value = aws_iam_openid_connect_provider.eks.url
}