resource_group = {
  "rg" = {
     rg1 = {
        rg_name  = "kube-rg"
        location = "East US"
     },
     rg2 = {
        rg_name  = "kube-rg2"
        location = "South india"
     }
    
  }
}

virtual_network = {
  "vnet" = {
    vnet1 = {
      vnet_name      = "vnet1"
      resource_group = "kube-rg"
      address_space  = ["10.0.0.0/16"]
      dns_servers    = ["8.8.8.8"]
      subnets = [
        {
          name             = "app-subnet"
          address_prefixes = ["10.0.1.0/24"]
        },
        {
          name             = "db-subnet"
          address_prefixes = ["10.0.2.0/24"]
        },
        {
          name             = "kube-subnet"
          address_prefixes = ["10.0.3.0/24"]
        }
      ]
    }
  }
}

kubernetes_cluster = {
  "k8s" = {
    k8s1 = {
      kubernetes_cluster_name = "kubeforge"
      resource_group          = "kube-rg"
      dns_prefix              = "k8s"
      default_node_pool_name  = "default"
      default_node_pool_count = 1
      vm_size                 = "Standard_DS2_v2"
      client_id               = "your-client-id"
      client_secret           = "your-client-secret"
    }
  }
}