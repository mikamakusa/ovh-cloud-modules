output "failover_ip_attach" {
  value = {
    for a in ovh_cloud_project_failover_ip_attach.this : a => {
      id             = a.id
      service_name   = a.service_name
      ip             = a.ip
      block          = a.block
      continent_code = a.continent_code
      geo_loc        = a.geo_loc
      routed_to      = a.routed_to
      progress       = a.progress
      status         = a.status
      sub_type       = a.sub_type
    }
  }
}

output "firewall" {
  value = {
    for a in ovh_ip_firewall.this : a => {
      id             = a.id
      ip             = a.ip
      ip_on_firewall = a.ip_on_firewall
      enabled        = a.enabled
      state          = a.state
    }
  }
}

output "firewall_rule" {
  value = {
    for a in ovh_ip_firewall_rule.this : a => {
      id                    = a.id
      ip                    = a.ip
      ip_on_firewall        = a.ip_on_firewall
      state                 = a.state
      action                = a.action
      creation_date         = a.creation_date
      destination           = a.destination
      destination_port      = a.destination_port
      destination_port_desc = a.destination_port_desc
      fragments             = a.fragments
      protocol              = a.protocol
      rule                  = a.rule
      sequence              = a.sequence
      source                = a.source
      source_port           = a.source_port
      source_port_desc      = a.source_port_desc
      tcp_option            = a.tcp_option
    }
  }
}

output "mitigation" {
  value = {
    for a in ovh_ip_mitigation.this : a => {
      id               = a.id
      ip               = a.ip
      ip_on_mitigation = a.ip_on_mitigation
      permanent        = a.permanent
      state            = a.state
      auto             = a.auto
    }
  }
}

output "move" {
  value = {
    for a in ovh_ip_move.this : a => {
      id                     = a.id
      can_be_terminated      = a.can_be_terminated
      country                = a.country
      description            = a.description
      ip                     = a.ip
      organisation_id        = a.organisation_id
      routed_to_service_name = a.routed_to[0].service_name
      type                   = a.type
      task_status            = a.task_status
      task_start_date        = a.task_start_date
    }
  }
}

output "reverse" {
  value = {
    for a in ovh_ip_reverse.this : a => {
      id                         = a.id
      ip                         = a.ip
      reverse                    = a.reverse
      readiness_timeout_duration = a.readiness_timeout_duration
    }
  }
}

output "service" {
  value = {
    for a in ovh_ip_service.this : a => {
      can_be_terminated      = a.can_be_terminated
      country                = a.country
      ip                     = a.ip
      order_date             = a.order[0].order_date
      order_id               = a.order[0].order_id
      order_expiration_date  = a.order[0].order_expiration_date
      order_details          = a.order[0].order_details
      order_description      = a.order[0].order_description
      order_detail_id        = a.order[0].order_detail_id
      order_domain           = a.order[0].order_domain
      order_quantity         = a.order[0].order_quantity
      organisation_id        = a.organisation_id
      routed_to_service_name = a.routed_to[0].service_name
      service_name           = a.service_name
      type                   = a.type
    }
  }
}

