.PHONY: help format validate docs examples clean

# Default target
help: ## Show this help message
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

format: ## Format all Terraform files
	@echo "Formatting Terraform files..."
	@terraform fmt -recursive .

validate: ## Validate all Terraform files
	@echo "Validating Terraform configuration..."
	@terraform init -backend=false
	@terraform validate

docs: ## Generate documentation
	@echo "Documentation is maintained manually in README.md"
	@echo "Please update README.md when making changes to variables or outputs"

examples: ## Validate all examples
	@echo "Validating simple example..."
	@cd examples/simple && terraform init -backend=false && terraform validate
	@echo "Validating complete example..."
	@cd examples/complete && terraform init -backend=false && terraform validate
	@echo "All examples validated successfully!"

clean: ## Clean up temporary files
	@echo "Cleaning up temporary files..."
	@find . -name ".terraform" -type d -exec rm -rf {} + 2>/dev/null || true
	@find . -name ".terraform.lock.hcl" -delete 2>/dev/null || true
	@find . -name "*.tfplan" -delete 2>/dev/null || true
	@echo "Cleanup complete!"

test: format validate examples ## Run all tests (format, validate, examples)
	@echo "All tests passed!"

init-example: ## Initialize and plan the simple example (requires DIGITALOCEAN_TOKEN)
	@echo "Initializing simple example..."
	@cd examples/simple && terraform init && terraform plan
