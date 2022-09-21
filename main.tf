data "aws_eks_cluster_auth" "this" {
  depends_on = [module.eks_cluster]
  name = module.eks_cluster.cluster_name
}

provider "kubectl" {
  host                   = module.eks_cluster.eks_endpoint
  token                  = data.aws_eks_cluster_auth.this.token
  cluster_ca_certificate = base64decode(module.eks_cluster.eks_certificate)
  load_config_file       = false
}

provider kubernetes {
  host     = module.eks_cluster.eks_endpoint
  token    = data.aws_eks_cluster_auth.this.token
  cluster_ca_certificate = base64decode(module.eks_cluster.eks_certificate)
}

provider helm {
  kubernetes {
    host     = module.eks_cluster.eks_endpoint
    token    = data.aws_eks_cluster_auth.this.token
    cluster_ca_certificate = base64decode(module.eks_cluster.eks_certificate)
  }
}

module "eks_cluster" {
    source                      = "./eks_cluster"
    availability_zones_count    = var.availability_zones_count
    project                     = var.project
    vpc_cidr                    = var.vpc_cidr
    subnet_cidr_bits            = var.subnet_cidr_bits
    desired_size                = var.desired_size
    min_size                    = var.min_size
    max_size                    = var.max_size
    tags                        = var.tags
}

module "karpenter" {
  source                      = "./karpenter"
  cluster_name                = module.eks_cluster.cluster_name
  eks_endpoint                = module.eks_cluster.eks_endpoint
  cluster_oidc_arn            = module.eks_cluster.cluster_oidc_arn
  cluster_oidc_url            = module.eks_cluster.cluster_oidc_url
  worker_iam_role_name        = module.eks_cluster.worker_iam_role_name
  karpenter_namespace         = var.karpenter_namespace
}