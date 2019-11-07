data "terraform_remote_state" "random-length" {
  backend = "remote"
  config = {
    organization = var.organization
    workspaces = {
      name = var.length-workspace
    }
  }
}

resource "random_string" "separator" {
  keepers = {
    uuid = uuid()
  }
  length  = data.terraform_remote_state.random-length.outputs.integer
  special = true
  upper   = false
  lower   = false
  number  = false
}
