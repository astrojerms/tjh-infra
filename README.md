# tjh-infra

This repository manages the infrastructure and application deployments using **Terraform**, **Argocd**, and **Helm**.

## Directory Structure

- **helm/charts/**: Contains Helm charts used to deploy applications and services to the Kubernetes cluster.
- **terraform/**: Manages infrastructure setup and updates, including provisioning EKS and other AWS resources.
- **terraform/envs/dev.tfvars**: Holds environment-specific variables for the EKS deployment in the `dev` environment.

## Deployment Process

### Helm

Helm charts are located in the `helm/charts` directory and are automatically deployed via GitHub Actions. The deployment workflow is triggered on any change to the `helm/charts` directory, ensuring up-to-date deployments on every code change.

### Terraform

Terraform configurations are stored in the `terraform` directory and are responsible for infrastructure provisioning. On each push to the repository, GitHub Actions runs the following Terraform commands:

1. **`terraform init`** - Initializes the working directory.
2. **`terraform fmt`** - Formats configuration files to the canonical style.
3. **`terraform plan`** - Generates an execution plan showing changes that would be made.

#### Applying Changes

To apply any infrastructure changes, approval is required under the **Actions** tab in GitHub. This ensures controlled application of changes to critical infrastructure.

### EKS Deployment Configuration

Configuration for the EKS deployment can be adjusted in `envs/dev.tfvars`. This file contains environment-specific settings that will apply to the `dev` environment. Changes here allow you to update settings and configurations for EKS resources.

## Workflows Overview

- **Helm Deployment Workflow**:
  - Automatically triggers on changes to `helm/charts`.
  - Installs Helm, configures AWS and kubectl, and deploys the Helm chart to the specified EKS namespace.

- **Terraform Workflow**:
  - Runs on every push to the repository.
  - Executes `terraform init`, `terraform fmt`, and `terraform plan`.
  - Requires manual approval under the **Actions** tab to apply any `terraform apply` commands.

## Prerequisites

Ensure you have the following secrets set up in your GitHub repository for successful deployments:
- **AWS_ACCESS_KEY_ID**
- **AWS_SECRET_ACCESS_KEY**
- **TF_VAR_AWS_SECRET_KEY**
- **TF_VAR_AWS_SECRET_ACCESS_KEY**

These credentials are used to authenticate with AWS for both Terraform and Helm operations.
