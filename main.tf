#quota_application
resource "alicloud_quotas_quota_application" "default" {
  notice_type       = var.notice_type
  desire_value      = var.desire_value
  product_code      = var.product_code
  quota_action_code = var.quota_action_code
  reason            = var.reason
  audit_mode        = var.audit_mode
  dimensions {
    key   = var.key
    value = var.value
  }
}