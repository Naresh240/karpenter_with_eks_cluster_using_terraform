output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "eks_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}