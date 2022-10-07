terraform {
  backend "s3" {
    bucket         = "terraform-yany" # s3 bucket 이름
    key            = "terraform/terraform.tfstate" # s3 내에서 저장되는 경로를 의미합니다.
    region         = "ap-northeast-2"  
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}