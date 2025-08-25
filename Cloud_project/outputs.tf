## ovh_cloud_project
output "project" {
  value = {
    for a in ovh_cloud_project.this : a => {
      access                = a.access
      description           = a.description
      order_date            = a.order[0].date
      order_order_id        = a.order[0].order_id
      order_expiration_date = a.order[0].expiration_date
      order_details         = a.order[0].details
      order_description     = a.order[0].description
      order_order_detail_id = a.order[0].order_detail_id
      order_domain          = a.order[0].domain
      order_quantity        = a.order[0].quantity
      project_name          = a.project_name
      project_id            = a.project_id
      status                = a.status
    }
  }
}

## ovh_cloud_project_alerting
output "project_alerting" {
  value = {
    for a in ovh_cloud_project_alerting.this : a => {
      id                = a.id
      creation_date     = a.creation_date
      delay             = a.delay
      email             = a.email
      monthly_threshold = a.monthly_threshold
    }
  }
}

## ovh_cloud_project_ssh_key
output "project_ssh_key" {
  value = {
    for a in ovh_cloud_project_ssh_key.this : a => {
      id           = a.id
      name         = a.name
      public_key   = a.public_key
      finger_print = a.finger_print
      region       = a.region
      regions      = a.regions
    }
  }
}

## ovh_cloud_project_user
output "project_user" {
  value = {
    for a in ovh_cloud_project_user.this : a => {
      creation_date     = a.creation_date
      description       = a.description
      openstack_rc      = a.openstack_rc
      password          = a.password
      password_reset    = a.password_reset
      roles_description = a.roles[0].description
      roles_id          = a.roles[0].id
      roles_name        = a.roles[0].name
      roles_permissions = a.roles[0].permissions
      service_name      = a.service_name
      status            = a.status
      username          = a.username
      role_name         = a.role_name
      role_names        = a.role_names
    }
  }
}

## ovh_cloud_project_volume
output "project_volume" {
  value = {
    for a in ovh_cloud_project_volume.this : a => {
      service_name = a.service_name
      region_name  = a.region_name
      description  = a.description
      name         = a.name
      size         = a.size
      id           = a.id
    }
  }
}

## ovh_cloud_project_volume_backup
output "project_volume_backup" {
  value = {
    for a in ovh_cloud_project_volume_backup.this : a => {
      creation_date = a.creation_date
      id            = a.id
      region        = a.region
      size          = a.size
      status        = a.status
    }
  }
}

