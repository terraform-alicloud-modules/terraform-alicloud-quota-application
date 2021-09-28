variable "region" {
  default = "cn-hangzhou"
}

variable "profile" {
  default = "default"
}

variable "name" {
  default = "terraform_test"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "172.16.0.0/16"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name    = var.name
  vpc_id  = alicloud_vpc.default.id
}

resource "alicloud_instance" "default" {
  availability_zone          = "cn-hangzhou-b"
  security_groups            = alicloud_security_group.default.*.id
  instance_type              = "ecs.n4.large"
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "test_foo_0927"
  vswitch_id                 = alicloud_vswitch.default.id
  internet_max_bandwidth_out = 10
}

data "alicloud_quotas_quota_applications" "default" {
  product_code = "ess"
  ids            = [alicloud_instance.default.id]
}

module "example" {
  source = "../"
}
