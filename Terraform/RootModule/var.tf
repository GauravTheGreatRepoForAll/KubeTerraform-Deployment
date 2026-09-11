variable "resource_group" {
  type = map(object({
    rg_name  = string
    location = string
  }))
}

variable "virtual_network" {
  type = map(object({
    vnet_name      = string
    resource_group = string
    address_space  = list(string)
    dns_servers    = list(string)

    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "kubernetes_cluster" {
  type = map(object({
    kubernetes_cluster_name = string
    resource_group          = string
    dns_prefix              = string
    default_node_pool_name  = string
    default_node_pool_count = number
    vm_size                 = string
    client_id               = string
    client_secret           = string
  }))
}