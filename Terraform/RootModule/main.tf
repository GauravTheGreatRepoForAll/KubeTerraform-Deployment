module "resource_group" {
  source = "../Child module/Resource group"
  resource_group = var.resource_group
}

module "virtual_network" {
  source = "../Child module/Virtual Network"
  virtual_network = var.virtual_network
  #resource_group = module.resource_group.rg
  depends_on = [module.resource_group]
}

module "kubernetes_cluster" {
  source = "../Child module/Kubernetes Cluster"
  kubernetes_cluster = var.kubernetes_cluster
  resource_group = module.resource_group.rg

  depends_on = [module.virtual_network]
}

