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

# Example usage of the projects module
module "example_project" {
  source = "../../"

  project_name        = "example-web-app"
  project_description = "Example web application project managed by Terraform"
  environment         = "development"

  # Example resource URNs (replace with actual URNs when available)
  cluster_urn          = ""
  database_cluster_urn = ""
  additional_resources = []
}

# Output the project details
output "project_id" {
  description = "The ID of the created project"
  value       = module.example_project.project_id
}

output "project_name" {
  description = "The name of the created project"
  value       = module.example_project.project_name
}
