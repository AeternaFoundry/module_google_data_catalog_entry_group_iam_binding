resource "google_data_catalog_entry_group_iam_binding" "data_catalog_entry_group_iam_bindings" {
  for_each = var.data_catalog_entry_group_iam_bindings

  entry_group = each.value.entry_group
  members     = each.value.members
  role        = each.value.role
  project     = each.value.project
  region      = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

