job "redis" {

  group "redis" {
    count = 1

    network {
      port "redis" {
        static = 6379
      }
    }

    task "redis" {
      driver = "podman"

      config {
        image          = "redis:7"
        auth_soft_fail = true
        ports = ["redis"]
      }

      identity {
        env  = true
        file = true
      }

      resources {
        cpu    = 500
        memory = 256
      }

    }
  }
}
