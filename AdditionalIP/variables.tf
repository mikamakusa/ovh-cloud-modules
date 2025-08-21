variable "failover_ip_attach" {
  type = list(object({
    service_name = string
    ip           = optional(string)
    routed_to    = optional(string)
  }))
  default = []
}

variable "firewalls" {
  type = list(object({
    ip             = string
    ip_on_firewall = string
    enabled        = optional(bool)
  }))
  default = []
}

variable "firewall_rules" {
  type = list(object({
    action           = string
    ip               = string
    ip_on_firewall   = string
    protocol         = string
    sequence         = number
    destination_port = optional(number)
    fragments        = optional(bool)
    source           = optional(string)
    source_port      = optional(number)
    tcp_option       = optional(string)
  }))
  default = []
}

variable "mitigations" {
  type = list(object({
    ip               = string
    ip_on_mitigation = string
    permanent        = optional(bool)
  }))
  default = []
}

variable "moves" {
  type = list(object({
    ip           = string
    service_name = optional(string)
  }))
  default = []
}

variable "reverses" {
  type = list(object({
    ip                         = string
    ip_reverse                 = string
    reverse                    = string
    readiness_timeout_duration = optional(string)
  }))
  default = []
}

variable "services" {
  type = list(object({
    description    = optional(string)
    ovh_subsidiary = optional(string)
    plan           = bool
    plan_option    = bool
  }))
  default = []
}

variable "plan" {
  type = object({
    duration     = string
    plan_code    = string
    pricing_mode = string
    catalog_name = optional(string)
    configuration = optional(list(object({
      label = string
      value = string
    })))
  })
  default = null
}

variable "plan_option" {
  type = object({
    duration     = string
    plan_code    = string
    pricing_mode = string
    catalog_name = optional(string)
    configuration = optional(list(object({
      label = string
      value = string
    })))
  })
  default = null
}