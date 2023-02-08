# Requerindo ambiente aws
terraform{

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.53.0"
      }
    }
}

# provisionando cloud..
provider "aws" {
  region = var.regiao_aws
}

