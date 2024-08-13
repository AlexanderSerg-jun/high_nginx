terraform {
  required_providers {
    yandex={
        source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}
provider "yandex" {
    token = var.access["token"]
    cloud_id = var.access["cloud_id"]
    folder_id = var.access["folder_id"]
    zone = var.access["zone"]
  
}
resource "yandex_compute_instance" "" {
  
}