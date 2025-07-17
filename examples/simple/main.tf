terraform {
  required_version = ">= 1.12.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.51.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  # token is configured via DIGITALOCEAN_TOKEN environment variable
}

# Simple usage of the projects module
module "simple_project" {
  source = "../../"

  project_name = "simple-project"
}

# Output the project details
output "project_id" {
  description = "The ID of the created project"
  value       = module.simple_project.project_id
}
