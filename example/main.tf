variable "region" {
  default = "cn-hangzhou"
}

variable "profile" {
  default = "default"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

data "alicloud_quotas_quota_applications" "default" {
  product_code = "ess"
}

module "example" {
  source = "../"
}
