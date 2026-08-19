terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  required_version = "~>1.15.0"
}

provider "yandex" {
  service_account_key_file = "authorized_key(1).json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}
