
terraform {
  backend "s3" {
    bucket               = "ark-all-terraform-state"
    key                  = "terraform.tfstate"
    encrypt              = true
    region               = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      managed_by = local.managed_by
      repository = local.repository
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us_east_1"

  default_tags {
    tags = {
      managed_by = local.managed_by
      repository = local.repository
    }
  }
}

data "aws_caller_identity" "current" {}

provider "random" {}

provider "null" {}
