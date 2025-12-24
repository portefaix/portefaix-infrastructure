module "tags" {
  source = "github.com/oci-landing-zones/terraform-oci-modules-governance.git//tags?ref=v0.1.6"

  tenancy_ocid = var.tenancy_ocid

  tags_configuration = {
  }
}
