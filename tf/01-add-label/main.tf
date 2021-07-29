terraform {
  required_providers {
    illumio-core = {
      source = "illumio/illumio-core"
      version = "0.1.0"
    }
  }
}

provider "illumio-core" {
  pce_host              = "https://scp1.illum.io"
  api_username          = "api_usernmae"
  api_secret            = "api_secret"
  request_timeout       = 30
  org_id                = 1
}

resource "illumio-core_label" "example" {
  key     = "role"
  value   = "example role 123"
}
