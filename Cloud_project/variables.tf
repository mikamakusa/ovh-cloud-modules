variable "region" {
  type    = string
  default = null
}

variable "project" {
  type = list(object({
    id             = string
    description    = optional(string)
    ovh_subsidiary = optional(string)
    plan = optional(list(object({
      duration     = string
      plan_code    = string
      pricing_mode = string
      configuration = optional(list(object({
        label = string
        value = string
      })))
    })))
    plan_option = optional(list(object({
      duration     = string
      plan_code    = string
      pricing_mode = string
      configuration = optional(list(object({
        label = string
        value = string
      })))
    })))
    alerting = optional(list(object({
      delay             = number
      email             = string
      monthly_threshold = number
    })))
    ssh_key = optional(list(object({
      name       = string
      public_key = string
    })))
    user = optional(list(object({
      description    = optional(string)
      role_name      = optional(string)
      role_names     = optional(list(string))
      password_reset = optional(string)
    })))
    volume = optional(list(object({
      region_name = string
      description = optional(string)
      name        = optional(string)
      size        = optional(number)
      type        = optional(string)
      backup      = optional(bool)
    })))
  }))
}