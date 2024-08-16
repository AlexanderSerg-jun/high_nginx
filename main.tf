//описание локальный файлов и пользователя виртуальной машины
locals {
    //пользователь виртуальной машины
    vm_user= alex
    //ssh пользователя  публичный и часный ключ для подключения
    ssh_public_key = ""
    ssh_private_key = ""
    //виртуальная частная сеть в облаке
    vpc_name = "my_network"
    // виртуальная частная подсеть имя и сетевая адресация
    subnet_cidrs = ["172.18.0.0/24"]
    subnet_name ="my_subnet"
}
// ресурс yandex cloud  виртуальная сеть
resource "yandex_vpc_network" "vnc"{
    // имя сети использует значение из locals
    name = local.vpc_name
}
// ресурс yandex cloud виртуальная подсеть
resource "yandex_vpc_subnet" "vsc"{
    name = local.subnet_name
    zone = local.zone
    network_id = yandex_vpc_network.vnc.id
    v4_cidr_blocks = local.subnet_cidrs
}
// описание