locals {
  ansible_groups = {
    webservers = [
      for vm in yandex_compute_instance.web : {
        name = vm.name
        ip   = vm.network_interface[0].nat_ip_address
        fqdn = vm.fqdn
      }
    ]
    databases = [
      for vm in values(yandex_compute_instance.db) : {
        name = vm.name
        ip   = vm.network_interface[0].nat_ip_address
        fqdn = vm.fqdn
      }
    ]
    storage = [
      {
        name = yandex_compute_instance.storage.name
        ip   = yandex_compute_instance.storage.network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.storage.fqdn
      }
    ]
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/hosts.ini"
  content = templatefile("${path.module}/hosts.tftpl", {
    groups = local.ansible_groups
  })
}
