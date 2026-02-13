variable "projects" {
  type        = list(string)
  description = "Danh sách tên các project cần tạo"
  default = [
    "kong",
    "dev-api-gateway-http-log",
    "prod-api-gateway-http-log",
  ]
}
