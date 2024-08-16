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
// виртуальная машина с nginx
resource "yandex_compute_instance" "balanser" {
  name="balance"
  platform = "standart-v1"
  hostname = "balance"
  resources{
    core = 2
    memory = 4
  }
  boot_disk{
    initialize_params{
      image_id ="fd8p7vi5c5bbs2s5i67s"
      size = 10
      type = "network-ssd"
    }
  }
  network_interface{
    subnet_id = yandex_vpc_subnet.balance-subnet-1.cloud_id
    nat = true
  }
  network_interface{
    subnet_id = yandex_vpc_subnet.
  }
}