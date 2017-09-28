# tf-quickstart

Terraform basic deployment.

To use:

0. Install [Terraform](https://www.terraform.io/intro/getting-started/install.html)
1. `cp terraform.tfvars{.example,}` # Make a copy of example
2. `vim terraform.tfvars` # Change vars, see [AWS Console for AMIs](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstanceWizard:)
3. `terraform init`
4. `terraform plan`
5. `terraform apply`
