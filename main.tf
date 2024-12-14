terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

module "VPC" {
  source = "./modules/VPC"
}

module "web_S3" {
  source = "./modules/web_S3"
  
}