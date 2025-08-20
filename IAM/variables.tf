variable "identity_groups" {
  type = list(object({
    name        = string
    description = optional(string)
    role        = optional(string)
    policies = optional(list(object({
      name               = string
      resources          = list(string)
      description        = optional(string)
      allow              = optional(list(string))
      except             = optional(list(string))
      deny               = optional(list(string))
      permissions_groups = optional(list(string))
    })))
  }))
  default     = []
  description = "Crée un identity group"

  validation {
    condition     = alltrue([for group in var.identity_groups : true if contains(["ADMIN", "REGULAR", "UNPRIVILEGED", "NONE"], group.role)])
    error_message = "Valid roles are ADMIN, REGULAR, UNPRIVILEGED, and NONE."
  }
}

variable "identity_users" {
  type = list(object({
    email       = string
    login       = string
    password    = string
    description = optional(string)
    group       = optional(string)
  }))
  default     = []
  description = "Crée un identity user"
}

variable "api_oauth2_clients" {
  type = list(object({
    description   = string
    flow          = string
    name          = string
    callback_urls = optional(list(string))
  }))
  default     = []
  description = "Crée un compte de service OAuth2"

  validation {
    condition     = alltrue([for client in var.api_oauth2_clients : true if contains(["AUTHORIZATION_CODE", "CLIENT_CREDENTIALS"], client.flow)])
    error_message = "The OAuth2 flow to use. AUTHORIZATION_CODE or CLIENT_CREDENTIALS are supported at the moment."
  }
}

variable "resource_groups" {
  type = list(object({
    name      = string
    resources = optional(list(string))
  }))
  default = []
}

variable "permission_groups" {
  type = list(object({
    description = string
    name        = string
    allow       = optional(list(string))
    except      = optional(list(string))
    deny        = optional(list(string))
  }))
  default = []
}