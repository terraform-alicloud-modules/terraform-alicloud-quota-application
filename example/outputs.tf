output "this_quotas_quota_application_name" {
  value = data.alicloud_quotas_quota_applications.default.applications.0.quota_name
}
