module "iam_assumable_role_karpenter" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.7.0"
  create_role                   = true
  role_name                     = "karpenter-controller-${var.cluster_name}"
  provider_url                  = var.oidc_issuer
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.karpenter_namespace}:karpenter"]
}