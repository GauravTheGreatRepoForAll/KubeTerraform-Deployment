module "resource_group" {
  source = "../ChileModule/Resource Group"
  resource_group = var.resource_group
}

module "virtual_network" {
  source = "../ChileModule/Virtual Network"
  virtual_network = var.virtual_network
  #resource_group = module.resource_group.rg
  depends_on = [module.resource_group]
}

module "kubernetes_cluster" {
  source = "../ChileModule/Kubernetes Cluster"
  kubernetes_cluster = var.kubernetes_cluster
  resource_group = module.resource_group.rg

  depends_on = [module.virtual_network]
}

