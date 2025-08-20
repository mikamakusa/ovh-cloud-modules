resource "ovh_iam_permissions_group" "this" {
  for_each    = { for group in var.permission_groups : group.name => group }
  description = each.value.description
  name        = each.value.name
  allow       = each.value.allow
  except      = each.value.except
  deny        = each.value.deny
}

resource "ovh_iam_policy" "this" {
  for_each           = { for group in var.identity_groups : group.name => group if contains(keys(group), "policies") && group.policies != null }
  identities         = [ovh_me_identity_group.this[each.key].urn]
  name               = lookup(each.value, "name")
  resources          = lookup(each.value, "resources")
  description        = lookup(each.value, "description")
  allow              = lookup(each.value, "allow")
  except             = lookup(each.value, "except")
  deny               = lookup(each.value, "deny")
  permissions_groups = [for group in ovh_iam_permissions_group.this : group.id if var.permission_groups != null]
}

resource "ovh_iam_resource_group" "this" {
  for_each  = { for group in var.resource_groups : group.name => group }
  name      = each.value.name
  resources = each.value.resources
}

resource "ovh_me_api_oauth2_client" "this" {
  for_each      = { for client in var.api_oauth2_clients : client.name => client }
  description   = each.value.description
  flow          = each.value.flow
  name          = each.value.name
  callback_urls = each.value.flow == "AUTHORIZATION_CODE" ? each.value.callback_urls : null
}

resource "ovh_me_identity_group" "this" {
  for_each    = { for group in var.identity_groups : group.name => group }
  name        = each.value.name
  description = each.value.description
  role        = each.value.role
}

resource "ovh_me_identity_user" "this" {
  for_each    = { for user in var.identity_users : user.email => user }
  email       = each.value.email
  login       = sensitive(each.value.login)
  password    = sensitive(each.value.password)
  description = each.value.description
  group       = each.value.group
}