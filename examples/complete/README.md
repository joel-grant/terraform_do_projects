# Complete Example

This example demonstrates how to use the DigitalOcean Projects module to create a project and assign resources to it.

## Prerequisites

1. DigitalOcean account and API token
2. Terraform >= 1.12.0 installed

## Setup

1. Export your DigitalOcean API token:
   ```bash
   export DIGITALOCEAN_TOKEN="your_token_here"
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the deployment:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

## What this example creates

- A DigitalOcean project named "example-web-app"
- Project configured for development environment
- Ready to accept cluster and database assignments

## Cleanup

To destroy the resources:
```bash
terraform destroy
```
