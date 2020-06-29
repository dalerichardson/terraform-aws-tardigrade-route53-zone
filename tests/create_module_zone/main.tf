provider aws {
  region = "us-east-1"
}

resource "random_string" "id" {
  length  = 8
  upper   = false
  special = false
  number  = false
}

module "zone" {
  source = "../..//modules/zone"

  providers = {
    aws = aws
  }

  create_route53_zone = true

  name = "${random_string.id.result}.com"

  tags = {
    environment = "testing"
  }
}

output "zone" {
  value = module.zone
}
