# 目的：GCP のフォルダを作成し、親（organization or folder）にぶら下げる
resource "google_folder" "this" {
  display_name = var.folder_name
  parent       = var.parent  # 例: organizations/123456789012 or folders/987654321098
}
