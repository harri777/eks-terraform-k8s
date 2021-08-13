module "network" {
  source = "./modules/network"
  
  cluster_name  = var.cluster_name
  aws_region    = var.aws_region
}

module "master" {
  source = "./modules/master"

  cluster_name  = var.cluster_name
  aws_region    = var.aws_region
  k8s_version   = var.k8s_version

  cluster_vpc   = module.network.cluster_vpc
  private_subnet_1a   = module.network.private_subnet_1a
  private_subnet_1b   = module.network.private_subnet_1b
}

module "nodes" {
  source = "./modules/nodes"

  cluster_name        = var.cluster_name
  aws_region          = var.aws_region
  k8s_version         = var.k8s_version

  cluster_vpc         = module.network.cluster_vpc
  private_subnet_1a   = module.network.private_subnet_1a
  private_subnet_1b   = module.network.private_subnet_1b

  eks_cluster         = module.master.eks_cluster
  master_sg           = module.master.security_group

  nodes_instances_sizes   = var.nodes_instances_sizes
  auto_scale_options      = var.auto_scale_options

  auto_scale_cpu     = var.auto_scale_cpu
}