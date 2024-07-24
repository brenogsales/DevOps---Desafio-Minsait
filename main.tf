# Declara o provedor AWS e sua versão.
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.59.0"
    }
  }
}

# Configura a região do provedor AWS.
provider "aws" {
  # Configuration options
  region = "us-east-1"
}