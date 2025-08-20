output "identity_groups" {
  value = {
    for group in ovh_me_identity_group.this : group => {
      id            = group.id
      name          = group.name
      role          = group.role
      default_group = group.default_group
      urn           = group.urn
    }
  }
}

output "identity_users" {
  value = {
    for user in ovh_me_identity_user.this : user => {
      id                   = user.id
      group                = user.group
      login                = sensitive(user.login)
      password             = sensitive(user.password)
      urn                  = user.urn
      last_update          = user.last_update
      password_last_update = user.password_last_update
      status               = user.status
    }
  }
}

output "clients" {
  value = {
    for client in ovh_me_api_oauth2_client.this : client => {
      client_id     = client.client_id
      client_secret = client.client_secret
      name          = client.name
      description   = client.description
      flow          = client.flow
      callback_urls = client.callback_urls
      id            = client.id
      identity      = client.identity
    }
  }
}

output "groups" {
  value = {
    for group in ovh_iam_resource_group.this : group => {
      id         = group.id
      owner      = group.owner
      created_at = group.created_at
      updated_at = group.updated_at
      read_only  = group.read_only
      urn        = group.urn
    }
  }
}

output "policies" {
  value = {
    for policy in ovh_iam_policy.this : policy => {
      id                = policy.id
      name              = policy.name
      allow             = policy.allow
      deny              = policy.deny
      except            = policy.except
      resources         = policy.resources
      identities        = policy.identities
      permission_groups = policy.permissions_groups
    }
  }
}

output "permission_groups" {
  value = {
    for group in ovh_iam_permissions_group.this : group => {
      id         = group.id
      name       = group.name
      urn        = group.urn
      allow      = group.allow
      deny       = group.deny
      except     = group.except
      created_at = group.created_at
      updated_at = group.updated_at
    }
  }
}