variable "notice_type" {
  description = "The specification of the notice type. Valid values: 0, 1, 2, 3"
  type        = string
  default     = "0"
}

variable "desire_value" {
  description = "The desire value of the quota application."
  type        = string
  default     = "200"
}

variable "product_code" {
  description = "The specification of the product code."
  type        = string
  default     = "ess"
}

variable "quota_action_code" {
  description = "The specification of the quota action code."
  type        = string
  default     = "q_db_instance"
}

variable "reason" {
  description = "The reason of the quota application."
  type        = string
  default     = "For Terraform Test"
}

variable "audit_mode" {
  description = "The specification of the audit mode. Valid values: Async, Sync. Default to: Async."
  type        = string
  default     = "Async"
}

variable "key" {
  description = "The specification of regionId"
  type        = string
  default     = "regionId"
}

variable "value" {
  description = "the value of the regionId."
  type        = string
  default     = "cn-hangzhou"
}
