variable "neon_project_list" {
  type        = list(string)
  description = "Danh sách tên các project cần tạo"
  default = [
    "kong",
  ]
}

resource "neon_project" "this" {
  for_each = toset(var.neon_project_list)

  org_id    = data.doppler_secrets.this.map["NEON_ORGANIZATION_ID"]
  name      = each.key
  region_id = "aws-ap-southeast-1"

  history_retention_seconds = 21600
}
