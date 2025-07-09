resource "aws_resourceexplorer2_index" "this" {
  type = "AGGREGATOR"
}

resource "aws_resourceexplorer2_view" "this" {
  name         = "portefaix"
  default_view = true
  scope        = aws_organizations_organization.this.arn

  # filters {
  #   filter_string = "resourcetype:ec2:instance"
  # }

  included_property {
    name = "tags"
  }

  depends_on = [aws_resourceexplorer2_index.this]
}
