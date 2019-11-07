resource "random_string" "separator" {
  keepers = {
    uuid = uuid()
  }
  length  = 1
  special = true
  upper   = false
  lower   = false
  number  = false
}
