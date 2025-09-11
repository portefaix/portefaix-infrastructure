module "fargate_profile" {
  source  = "terraform-aws-modules/eks/aws//modules/fargate-profile"
  version = "21.2.0"

  cluster_name = var.cluster_name
  name         = var.fargate_profile_name

  selectors = var.fargate_selectors

  tags = merge(
    { "Name" = var.fargate_profile_name },
    var.cluster_tags,
    var.fargate_tags,
    var.tags
  )
}
