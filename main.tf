data "terraform_remote_state" "random-length" {
  backend = "remote"
  config = {
    hostname = var.tfe_hostname
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
  special = false
  upper   = true
  lower   = true
  number  = true
}
