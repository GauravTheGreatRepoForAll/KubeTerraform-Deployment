variable "kubernetes_cluster" {
  type = map(object({
    kubernetes_cluster_name = string
    resource_group          = string
    dns_prefix               = string

    default_node_pool_name  = string
    default_node_pool_count = number
    vm_size                  = string

    node_pool_name = string
    node_count     = number
  }))
}