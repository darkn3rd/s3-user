
variable "name" {
  type        = string
  description = "name of the user"
}

variable "path" {
  type        = string
  description = "Path user is created"
  default     = "/"
}


variable "force_destroy" {
  type        = bool
  description = "User destroy even if it has non-terraform managed access keys, login profile, or MFA device"
  default     = false
}

variable "actions" {
  type        = list(string)
  default     = ["s3:GetObject"]
  description = "Actions allowed in the policy"
}

variable "resources" {
  type        = list(string)
  description = "Resources to apply the actions specified in the policy"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Toggles whether resource is created"
}

variable "access_key_enabled" {
  type        = bool
  description = "Set to true to have the access key get created"
  default     = false
}
