terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.77.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}
provider "aws" {
  # Configuration options
  region = "ap-northeast-1"
  alias  = "tokyo"
}

provider "aws" {
  # Configuration options
  region = "ap-northeast-3"
  alias  = "osaka"
}

provider "aws" {
  # Configuration options
  region = "eu-west-2"
  alias  = "london"
}

provider "aws" {
  # Configuration options
  region = "sa-east-1"
  alias  = "sao-paulo"
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
  alias  = "australia"
}

provider "aws" {
  # Configuration options
  region = "ap-east-1"
  alias  = "hong-kong"
}

provider "aws" {
  # Configuration options
  region = "us-west-1"
  alias  = "california"
}
