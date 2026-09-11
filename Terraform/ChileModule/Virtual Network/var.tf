variable "virtual_network" {
  type = map(object({
    vnet_name      = string
    resource_group = string
    address_space  = list(string)
    dns_servers    = list(string)
    subnets        = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}