job "postgresql" {

  group "postgresql" {
    count = 1

    network {
      port "postgresql" {
        static = 5432
      }
    }

    volume "postgresql" {
      type = "host"
      source = "postgresql"
    }

    task "postgresql" {
      driver = "podman"

      config {
        image          = "postgres:alpine"
        auth_soft_fail = true
        ports = ["postgresql"]
      }

      env {
        POSTGRES_PASSWORD="123123"
        POSTGRES_DB=postgres
      }

      identity {
        env  = true
        file = true
      }

      resources {
        cpu    = 500
        memory = 256
      }

      service {
        name = "postgresql"
        port = "postgresql"
      }

      volume_mount {
        volume = "postgresql"
        destination = "/var/lib/postgresql/data"
      }

    }
  }
}
