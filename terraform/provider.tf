terraform {
  cloud {
    organization = "toeichust"
    workspaces {
      name = "infrastructure-postgres-neon-settings-terraform"
    }
  }

  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.21.1"
    }

    neon = {
      source  = "kislerdm/neon"
      version = "~> 0.6.0"
    }
  }
}

provider "doppler" {
  doppler_token = var.DOPPLER_TOKEN
}

data "doppler_secrets" "this" {
  project = var.DOPPLER_PROJECT
  config  = var.DOPPLER_CONFIG
}

provider "neon" {
  api_key = data.doppler_secrets.this.map["NEON_API_KEY"]
}
