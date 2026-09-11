resource "azurerm_kubernetes_cluster" "k8s" {

  for_each = var.kubernetes_cluster

  name                = each.value.kubernetes_cluster_name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  dns_prefix          = each.value.dns_prefix

  default_node_pool {

    name       = each.value.default_node_pool_name
    node_count = each.value.default_node_pool_count
    vm_size    = each.value.vm_size
  }
    node_provisioning_profile {
    mode = "Manual"
  }
 identity {
    type = "SystemAssigned"
  }
}


resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {

  for_each = var.kubernetes_cluster

  name                  = each.value.node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s[each.key].id

  vm_size   = each.value.vm_size
  node_count = each.value.node_count
}
