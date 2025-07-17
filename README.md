# DigitalOcean Projects Terraform Module

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![DigitalOcean](https://img.shields.io/badge/DigitalOcean-%230167ff.svg?style=for-the-badge&logo=digitalOcean&logoColor=white)](https://www.digitalocean.com/)

A Terraform module for creating and managing DigitalOcean Projects. This module helps organize your DigitalOcean resources by grouping them into projects for better management and billing organization.

## Features

- ✅ Create DigitalOcean projects with customizable settings
- ✅ Assign Kubernetes clusters to projects
- ✅ Assign database clusters to projects  
- ✅ Support for additional resource assignments
- ✅ Configurable environment settings
- ✅ Comprehensive outputs for integration

## Usage

### Basic Usage

```hcl
module "my_project" {
  source = "github.com/your-username/terraform-digitalocean-projects"

  project_name = "my-web-application"
}
```

### Complete Usage

```hcl
module "my_project" {
  source = "github.com/your-username/terraform-digitalocean-projects"

  project_name        = "my-web-application"
  project_description = "Production web application infrastructure"
  environment         = "production"
  
  # Assign existing resources
  cluster_urn          = digitalocean_kubernetes_cluster.main.urn
  database_cluster_urn = digitalocean_database_cluster.main.urn
  
  # Additional resources like droplets, load balancers, etc.
  additional_resources = [
    digitalocean_droplet.web.urn,
    digitalocean_loadbalancer.main.urn
  ]
}
```

## Examples

- [Simple Example](./examples/simple) - Minimal configuration
- [Complete Example](./examples/complete) - Full feature demonstration

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.12.0 |
| digitalocean | >= 2.51.0 |

## Providers

| Name | Version |
|------|---------|
| digitalocean | >= 2.51.0 |

## Resources

| Name | Type |
|------|------|
| digitalocean_project.project | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_name | The name of the DigitalOcean project | `string` | n/a | yes |
| project_description | The description of the DigitalOcean project | `string` | `"Managed by Terraform"` | no |
| environment | The environment (e.g., development, staging, production) | `string` | `"development"` | no |
| cluster_urn | The URN of the Kubernetes cluster to assign to the project | `string` | `""` | no |
| database_cluster_urn | The URN of the database cluster to assign to the project | `string` | `""` | no |
| additional_resources | Additional resource URNs to assign to the project | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| project_id | The ID of the DigitalOcean project |
| project_name | The name of the DigitalOcean project |
| project_description | The description of the DigitalOcean project |
| project_environment | The environment of the DigitalOcean project |

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Update documentation
6. Submit a pull request

## License

This module is released under the MIT License. See [LICENSE](LICENSE) for details.

## Support

For issues and questions:
- 🐛 [Report bugs](https://github.com/your-username/terraform-digitalocean-projects/issues)
- 💬 [Start discussions](https://github.com/your-username/terraform-digitalocean-projects/discussions)
- 📖 [Read the docs](https://registry.terraform.io/modules/your-username/projects/digitalocean)
