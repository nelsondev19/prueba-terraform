variable "token_secret" {
  type        = string
  description = "Este es el TOKEN SECRET de Digital Ocean"
  sensitive   = true
}

variable "image_os" {
  type        = map(string)
  description = "Especifica el tipo de OS que usara el servidor"
  default = {
    ubuntu = "ubuntu-20-04-x64"
  }
}


variable "name_droplet" {
  type        = string
  description = "Nombre de Droplet en Digital Ocean"
  default     = "web-1"
}

variable "region_droplet" {
  type        = map(string)
  description = "Region de Droplet en Digital Ocean"
  default = {
    san_francisco = "sfo3"
  }
}

variable "size_droplet" {
  type        = string
  description = "Tamaño de recursos del computador"
  default     = "s-1vcpu-1gb"
}
