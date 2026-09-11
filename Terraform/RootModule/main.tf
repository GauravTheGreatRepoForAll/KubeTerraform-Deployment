module "resource_group" {
  source = "../ChileModule/Resource Group"
  resource_group = var.resource_group
}

module "virtual_network" {
  source = "../ChileModule/Virtual Network"
  depends_on = [module.resource_group]
}

module "kubernetes_cluster" {
  source = "../ChileModule/Kbernetes"
  kubernetes_cluster = var.kubernetes_cluster

  depends_on = [module.virtual_network]
}

