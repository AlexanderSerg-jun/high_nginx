variable "access" {
    type = map(any)
    default = {
      token = ""
      folder_id =""
      cloud_id =""
      zone =""
    }
  
}
variable "data" {
    type = map(any)
    default = {
      count =2
      account = alex
    }  
}