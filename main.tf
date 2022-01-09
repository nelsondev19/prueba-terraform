terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token_secret
}

resource "digitalocean_ssh_key" "keydesktop" {
  name       = "ssh key"
  public_key = file("./id_rsa.pub")
}

resource "digitalocean_droplet" "web" {
  image     = var.image_os["ubuntu"]
  name      = var.name_droplet
  region    = var.region_droplet["san_francisco"]
  size      = var.size_droplet
  ssh_keys  = [digitalocean_ssh_key.keydesktop.fingerprint]
  user_data = "${file("userdata.yaml")}"
}
