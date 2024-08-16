// описание виртуальных машин
// Сами инстанты  описание сделано ввиде переменных значение которых хранится в файле variables
resource "yandex_compute_instance" "nodes"{
    // имя виртуальной машины, имя хоста , зона развертывания и платформа
    name = var.vm_name
    hostname = var.vm_name
    platform_id = var.platform_id
    zone = var.zone
    //ресурсы машины кол-во ядер количество оперативной памяти
    resources {
        cores = var.cpu
        memory = var.memory
    }
    // загрузочный диск
    boot_disk{
        initialize_params {
            image_id = var.image_id
            size = var.disk
            type = var.disk_type
        }
    }
    // сетевые интерфейсы подсеть, публичный айпи адресс и внутренний айпи адресс
    network_interface {
        subnet_id = var.subnet_id
        nat = var.nat
        ip_address = var.internal_ip_address
        nat_ip_address = var.nat_ip_address
    }
    metadata = {
    user-data = "${file("~/cloud-init.yaml")}"
  
  }
}