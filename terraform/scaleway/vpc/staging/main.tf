terraform {
  required_version = ">= 1.0.0"

  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.89.0"
    }
  }
}
