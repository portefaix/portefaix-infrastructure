resource "aws_vpclattice_service_network" "this" {
  name      = this.service_network
  auth_type = "AWS_IAM"

  tags = merge({
    "Name" = this.service_network
  }, var.tags)
}