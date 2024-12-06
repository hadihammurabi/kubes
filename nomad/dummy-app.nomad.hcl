job "dummy-app" {

  group "web" {
    count = 3

    network {
      port "web" {
        to = 80
      }
    }

    task "web" {
      driver = "podman"

      config {
        image          = "strm/helloworld-http"
        auth_soft_fail = true
        ports = ["web"]
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
        name = "dummy-app-web"
        port = "web"
      }

    }
  }
}
