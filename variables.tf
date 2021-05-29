variable "create_readonly_role" {
  type        = bool
  default     = true
  description = "Whether to create a role_readonly role"
}

variable "create_admin_role" {
  type        = bool
  default     = true
  description = "Whether to create a role_admin role"
}

variable "role_readonly_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/ReadOnlyAccess"

  validation {
    condition     = can(regex("^arn:aws:iam::(\\d{12}|aws):policy/.*", var.role_readonly_policy_arn))
    error_message = "The policy that you want to give to the role_readonly must be of the form /^arn:aws:iam::\\d*:policy\\/.*/ \nDefaults to the AWS ReadOnlyAcces."
  }
}

variable "role_admin_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AdministratorAccess"

  validation {
    condition     = can(regex("^arn:aws:iam::(\\d{12}|aws):policy/.*", var.role_admin_policy_arn))
    error_message = "The policy that you want to give to the role_admin must be of the form /^arn:aws:iam::\\d*:policy\\/.*/ \nDefaults to the AWS AdministratorAccess."
  }
}

variable "role_admin_max_session_duration_sec" {
  type = number
  default = 3600
  description = "The maximum length of a session using the role_admin role"

  validation {
    condition = var.role_admin_max_session_duration_sec >= 60 * 60 * 1 && var.role_admin_max_session_duration_sec <= 60*60*12
    error_message = "The max session duration must be given in seconds, and be between 1 and 12 hours."
  }
}

variable "role_readonly_max_session_duration_sec" {
  type = number
  default = 3600
  description = "The maximum length of a session using the role_readonly role"

  validation {
    condition = var.role_readonly_max_session_duration_sec >= 60 * 60 * 1 && var.role_readonly_max_session_duration_sec <= 60*60*12
    error_message = "The max session duration must be given in seconds, and be between 1 and 12 hours."
  }
}
