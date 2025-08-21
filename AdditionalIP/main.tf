resource "ovh_cloud_project_failover_ip_attach" "this" {
  for_each     = { for ip in var.failover_ip_attach : ip.service_name => ip }
  service_name = each.value.service_name
  ip           = each.value.ip
  routed_to    = each.value.routed_to
}

resource "ovh_ip_firewall" "this" {
  for_each       = { for firewall in var.firewalls : firewall.ip => firewall }
  ip             = each.value.ip
  ip_on_firewall = each.value.ip_on_firewall
  enabled        = each.value.enabled
}

resource "ovh_ip_firewall_rule" "this" {
  for_each         = { for rule in var.firewall_rules : rule.action => rule }
  action           = each.value.action
  ip               = each.value.ip
  ip_on_firewall   = each.value.ip_on_firewall
  protocol         = each.value.protocol
  sequence         = each.value.sequence
  destination_port = each.value.destination_port
  fragments        = each.value.fragments
  source           = each.value.source
  source_port      = each.value.source_port
  tcp_option       = each.value.tcp_option
}

resource "ovh_ip_mitigation" "this" {
  for_each         = { for mitigation in var.mitigations : mitigation.ip => mitigation }
  ip               = each.value.ip
  ip_on_mitigation = each.value.ip_on_mitigation
  permanent        = each.value.permanent
}

resource "ovh_ip_move" "this" {
  for_each = { for move in var.moves : move.ip => move }
  ip       = each.value.ip

  routed_to {
    service_name = each.value.service_name != null ? each.value.service_name : ""
  }
}

resource "ovh_ip_reverse" "this" {
  for_each                   = { for reverse in var.reverses : reverse.ip => reverse }
  ip                         = each.value.ip
  ip_reverse                 = each.value.ip_reverse
  reverse                    = each.value.reverse
  readiness_timeout_duration = each.value.readiness_timeout_duration
}

resource "ovh_ip_service" "this" {
  for_each       = { for service in var.services : service.description => service }
  description    = each.value.description
  ovh_subsidiary = each.value.ovh_subsidiary

  dynamic "plan" {
    for_each = each.value.plan != false && var.plan != null ? [""] : []
    content {
      duration     = var.plan.duration
      plan_code    = var.plan.plan_code
      pricing_mode = var.plan.pricing_mode
      catalog_name = var.plan.catalog_name

      dynamic "configuration" {
        for_each = var.plan.configuration != null ? [""] : []
        content {
          label = lookup(configuration.value, "label")
          value = lookup(configuration.value, "value")
        }
      }
    }
  }

  dynamic "plan_option" {
    for_each = each.value.plan_option != false && var.plan_option != null ? [""] : []
    content {
      duration     = var.plan_option.duration
      plan_code    = var.plan_option.plan_code
      pricing_mode = var.plan_option.pricing_mode
      catalog_name = var.plan_option.catalog_name

      dynamic "configuration" {
        for_each = var.plan_option.configuration != null ? [""] : []
        content {
          label = lookup(configuration.value, "label")
          value = lookup(configuration.value, "value")
        }
      }
    }
  }
}