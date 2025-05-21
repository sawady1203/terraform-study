# 目的：特定の組織ポリシー（constraint）を Folder または Organization に設定する

resource "google_organization_policy" "this" {
  constraint = var.constraint
  org_id     = var.org_id

  boolean_policy {
    enforced = var.enforced
  }
}
