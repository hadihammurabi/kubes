data_dir="/opt/nomad/data"

client {
  enabled = true
  network_interface = "enp3s0"
}

consul {
  address = "127.0.0.1:8500"
}

ports {
  http = 4747
}

