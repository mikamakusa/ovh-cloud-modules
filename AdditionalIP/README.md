## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ovh"></a> [ovh](#requirement\_ovh) | >= 2.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 2.6.0 |

## Modules

No modules.

## Examples
- **firewall** + **firewall_rule**
```hcl
module "firewall" {
  source = "./"
  firewalls = [{
    ip             = "100.5.5.105"
    ip_on_firewall = "10.1.1.2"
    enabled        = true
  }]
  firewall_rules = [{
    ip             = "100.5.5.105"
    ip_on_firewall = "10.1.1.2"
    sequence       = 0
    action         = "deny"
    protocol       = "tcp"
  }]
}
```
- **mitigation**
```hcl
module "mitigation" {
  source = "./"
  mitigations = [{
    ip               = "100.5.5.105"
    ip_on_mitigation = "100.5.10.200"
  }]
}
```
- **move**
```hcl
module "move" {
  source = "./"
  moves = [{
    ip = "1.2.3.4"
  }]
}
```
- **reverse**
```hcl
module "reverse" {
  source = "./"
  reverses = [{
    readiness_timeout_duration = "1m"
    ip                         = "192.0.2.0/24"
    ip_reverse                 = "192.0.2.1"
    reverse                    = "example.com"
  }]
}
```

## Resources

| Name | Type |
|------|------|
| [ovh_cloud_project_failover_ip_attach.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_failover_ip_attach) | resource |
| [ovh_ip_firewall.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/ip_firewall) | resource |
| [ovh_ip_firewall_rule.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/ip_firewall_rule) | resource |
| [ovh_ip_mitigation.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/ip_mitigation) | resource |
| [ovh_ip_move.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/ip_move) | resource |
| [ovh_ip_reverse.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/ip_reverse) | resource |
| [ovh_ip_service.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/ip_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_failover_ip_attach"></a> [failover\_ip\_attach](#input\_failover\_ip\_attach) | n/a | <pre>list(object({<br/>    service_name = string<br/>    ip           = optional(string)<br/>    routed_to    = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | n/a | <pre>list(object({<br/>    action           = string<br/>    ip               = string<br/>    ip_on_firewall   = string<br/>    protocol         = string<br/>    sequence         = number<br/>    destination_port = optional(number)<br/>    fragments        = optional(bool)<br/>    source           = optional(string)<br/>    source_port      = optional(number)<br/>    tcp_option       = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_firewalls"></a> [firewalls](#input\_firewalls) | n/a | <pre>list(object({<br/>    ip             = string<br/>    ip_on_firewall = string<br/>    enabled        = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_mitigations"></a> [mitigations](#input\_mitigations) | n/a | <pre>list(object({<br/>    ip               = string<br/>    ip_on_mitigation = string<br/>    permanent        = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_moves"></a> [moves](#input\_moves) | n/a | <pre>list(object({<br/>    ip           = string<br/>    service_name = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | n/a | <pre>object({<br/>    duration     = string<br/>    plan_code    = string<br/>    pricing_mode = string<br/>    catalog_name = optional(string)<br/>    configuration = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })))<br/>  })</pre> | `null` | no |
| <a name="input_plan_option"></a> [plan\_option](#input\_plan\_option) | n/a | <pre>object({<br/>    duration     = string<br/>    plan_code    = string<br/>    pricing_mode = string<br/>    catalog_name = optional(string)<br/>    configuration = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })))<br/>  })</pre> | `null` | no |
| <a name="input_reverses"></a> [reverses](#input\_reverses) | n/a | <pre>list(object({<br/>    ip                         = string<br/>    ip_reverse                 = string<br/>    reverse                    = string<br/>    readiness_timeout_duration = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_services"></a> [services](#input\_services) | n/a | <pre>list(object({<br/>    description    = optional(string)<br/>    ovh_subsidiary = optional(string)<br/>    plan           = bool<br/>    plan_option    = bool<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_failover_ip_attach"></a> [failover\_ip\_attach](#output\_failover\_ip\_attach) | n/a |
| <a name="output_firewall"></a> [firewall](#output\_firewall) | n/a |
| <a name="output_firewall_rule"></a> [firewall\_rule](#output\_firewall\_rule) | n/a |
| <a name="output_mitigation"></a> [mitigation](#output\_mitigation) | n/a |
| <a name="output_move"></a> [move](#output\_move) | n/a |
| <a name="output_reverse"></a> [reverse](#output\_reverse) | n/a |
| <a name="output_service"></a> [service](#output\_service) | n/a |
