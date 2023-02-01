# HCL - Hashicorp Configuration Language
# Linguagem declarativa

provider "aws" {
  region = "us-east-1"
}

# Centralizar o arquivo de controle de estado fo Terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-igti-dr"
    key = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-1"
  }
}