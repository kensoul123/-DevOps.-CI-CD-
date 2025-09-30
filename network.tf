#----------------- VPC -----------------------------
resource "yandex_vpc_network" "dipnet" {
  name = "network_project"
  description  = "new network for the project"
}

resource "yandex_vpc_route_table" "inner-to-nat" {
  network_id = yandex_vpc_network.dipnet.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.bastion.network_interface.0.ip_address
  }
}
#----------------- subnet -----------------------------
resource "yandex_vpc_subnet" "subnet_web-1" {
  name           = "subnet_web-1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.dipnet.id
  v4_cidr_blocks = ["10.10.1.0/28"]
  route_table_id = yandex_vpc_route_table.inner-to-nat.id
}

resource "yandex_vpc_subnet" "subnet_web-2" {
  name           = "subnet_web-2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.dipnet.id
  v4_cidr_blocks = ["10.10.2.0/28"]
  route_table_id = yandex_vpc_route_table.inner-to-nat.id
}

resource "yandex_vpc_subnet" "private" {
  name           = "internal-subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.dipnet.id
  v4_cidr_blocks = ["10.10.3.0/27"]
  route_table_id = yandex_vpc_route_table.inner-to-nat.id
}

resource "yandex_vpc_subnet" "public" {
  name           = "public-subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.dipnet.id
  v4_cidr_blocks = ["10.10.4.0/27"]
}


#----------------- target_group -----------------
resource "yandex_alb_target_group" "web_tg_group" {
  name = "new-target-group"

  target {
    ip_address = yandex_compute_instance.web-1.network_interface.0.ip_address
    subnet_id  = yandex_vpc_subnet.subnet_web-1.id
  }

  target {
    ip_address = yandex_compute_instance.web-2.network_interface.0.ip_address
    subnet_id  = yandex_vpc_subnet.subnet_web-2.id
  }
}

#----------------- backend_group -----------------

resource "yandex_alb_backend_group" "web_alb_bg" {
  name = "new-backend-group"

  http_backend {
    name             = "http-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.web_tg_group.id]
    load_balancing_config {
      panic_threshold = 90
    }
    healthcheck {
      timeout             = "10s"
      interval            = "2s"
      healthy_threshold   = 10
      unhealthy_threshold = 15
      http_healthcheck {
        path = "/"
      }
    }
  }
}
#----------------- HTTP router -----------------
resource "yandex_alb_http_router" "http_router" {
  name = "new-http-router"
}

resource "yandex_alb_virtual_host" "root" {
  name           = "root-virtual-host"
  http_router_id = yandex_alb_http_router.http_router.id
  route {
    name = "root-path"
    http_route {
      http_match {
        path {
          prefix = "/"
        }
      }
      http_route_action {
        backend_group_id = yandex_alb_backend_group.web_alb_bg.id
        timeout          = "3s"
      }
    }
  }
}
#----------------- L7 balancer -----------------

resource "yandex_alb_load_balancer" "l7b" {
  name               = "new-load-balancer"
  network_id         = yandex_vpc_network.dipnet.id
  security_group_ids = [yandex_vpc_security_group.public-load-balancer.id, yandex_vpc_security_group.internal.id] 

  allocation_policy {
    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.private.id
    }
  }

  listener {
    name = "my-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.http_router.id
      }
    }
  }
}
