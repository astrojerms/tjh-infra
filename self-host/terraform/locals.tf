locals {
  # Master Node configuration
  vm_master_nodes = {
    "0" = {
      vm_id          = 200
      node_name      = "k8s-master-00"
      clone_target   = "template-debian-12-docker"
      node_cpu_cores = "2"
      node_memory    = 4048
      node_ipconfig  = "ip=172.30.250.170/16,gw=172.30.1.1"
      node_disk      = "100" # in GB
    }
    # "1" = {
    #   vm_id          = 201
    #   node_name      = "k8s-master-01"
    #   clone_target   = "template-debian-12-docker"
    #   node_cpu_cores = "2"
    #   node_memory    = 2048
    #   node_ipconfig  = "ip=192.168.0.171/16,gw=192.168.0.1"
    #   node_disk      = "32" # in GB
    # }
    # "2" = {
    #   vm_id          = 202
    #   node_name      = "k8s-master-02"
    #   clone_target   = "template-debian-12-docker"
    #   node_cpu_cores = "2"
    #   node_memory    = 2048
    #   node_ipconfig  = "ip=192.168.0.172/16,gw=192.168.0.1"
    #   node_disk      = "32" # in GB
    # }
  }
  # Worker Node configuration
  vm_worker_nodes = {
    "0" = {
      vm_id                = 300
      node_name            = "k8s-worker-00"
      clone_target         = "template-debian-12-docker"
      node_cpu_cores       = "4"
      node_memory          = 6144
      node_ipconfig        = "ip=172.30.250.180/16,gw=172.30.1.1"
      node_disk            = "100"
      additional_node_disk = "128" # for longhorn
    }
    "1" = {
      vm_id                = 301
      node_name            = "k8s-worker-01"
      clone_target         = "template-debian-12-docker"
      node_cpu_cores       = "4"
      node_memory          = 6144
      node_ipconfig        = "ip=172.30.250.181/16,gw=172.30.1.1"
      node_disk            = "100"
      additional_node_disk = "128" # for longhorn
    }
    # "2" = {
    #   vm_id                = 302
    #   node_name            = "k8s-worker-02"
    #   clone_target         = "template-debian-12-docker"
    #   node_cpu_cores       = "4"
    #   node_memory          = 6144
    #   node_ipconfig        = "ip=192.168.0.182/16,gw=192.168.0.1"
    #   node_disk            = "32"
    #   additional_node_disk = "128" # for longhorn
    # }
  }
}
