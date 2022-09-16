module "eks-cluster" {
    source                      = "./eks-cluster"
    availability_zones_count    = var.availability_zones_count
    project                     = var.project
    vpc_cidr                    = var.vpc_cidr
    subnet_cidr_bits            = var.subnet_cidr_bits
    tags                        = var.tags
}

provider kubernetes {
  host     = module.eks_cluster.eks_endpoint
  token    = module.eks_cluster.eks_token
  cluster_ca_certificate = module.eks_cluster.eks_ca_certificate
}

provider helm {
  kubernetes {
    host     = module.eks_cluster.eks_endpoint
    token    = module.eks_cluster.eks_token
    cluster_ca_certificate = module.eks_cluster.eks_ca_certificate
  }
}