provider "oci" {
  region       = var.region
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  # private_key  = var.private_key
  private_key = base64decode(var.oci_private_key)
}
