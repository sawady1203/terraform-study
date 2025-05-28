# 目的：GCP プロジェクトを指定のフォルダ下に作成し、課金情報を紐づける

resource "google_project" "this" {
  name       = var.project_name
  project_id = var.project_id
  folder_id  = var.folder_id
  billing_account = var.billing_account
}