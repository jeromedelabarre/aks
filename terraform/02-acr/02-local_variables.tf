## Generation d'un nom aléatoire pour le cluster (si besoin)
resource "random_pet" "random_name" {
  keepers   = {
    name = var.acr_name
  }
  separator = ""
}

