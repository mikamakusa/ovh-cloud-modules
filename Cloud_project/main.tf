resource "ovh_cloud_project" "this" {
  for_each = { for project in var.project : project.id => project}
  description    = each.value.description
  ovh_subsidiary = each.value.ovh_subsidiary

  dynamic "plan" {
    for_each = each.value.plan != null ? [""] : []
    content {
      duration     = lookup(plan.value, "duration")
      plan_code    = lookup(plan.value, "plan_code")
      pricing_mode = lookup(plan.value, "pricing_mode")

      dynamic "configuration" {
        for_each = lookup(plan.value, "configuration") != null ? [""] : []
        content {
          label = lookup(configuration.value, "label")
          value = lookup(configuration.value, "value")
        }
      }
    }
  }

  dynamic "plan_option" {
    for_each = each.value.plan_option != null ? [""] : []
    content {
      duration     = lookup(plan_option.value, "duration")
      plan_code    = lookup(plan_option.value, "plan_code")
      pricing_mode = lookup(plan_option.value, "pricing_mode")

      dynamic "configuration" {
        for_each = lookup(plan_option.value, "configuration") != null ? [""] : []
        content {
          label = lookup(configuration.value, "label")
          value = lookup(configuration.value, "value")
        }
      }
    }
  }
}

resource "ovh_cloud_project_alerting" "this" {
  for_each = { for project in var.project : project.id => project if contains(keys(project), "alerting") && project.alerting != null }
  delay             = lookup(each.value, "delay")
  email             = lookup(each.value, "email")
  monthly_threshold = lookup(each.value, "monthly_threshold")
  service_name      = ovh_cloud_project. this[each.key].project_id
}

resource "ovh_cloud_project_ssh_key" "this" {
  for_each = { for project in var.project : project.id => project if contains(keys(project), "ssh_key") && project.ssh_key != null }
  name         = lookup(each.value, "name")
  public_key   = lookup(each.value, "public_key")
  service_name = ovh_cloud_project.this[each.key].project_id
}

resource "ovh_cloud_project_user" "this" {
  for_each = { for project in var.project : project.id => project if contains(keys(project), "user") && project.user != null }
  service_name   = ovh_cloud_project.this[each.key].project_id
  description    = lookup(each.value, "description")
  role_name      = lookup(each.value, "role_name")
  role_names     = lookup(each.value, "role_names")
  password_reset = lookup(each.value, "password_reset")
}

resource "ovh_cloud_project_volume" "this" {
  for_each = { for project in var.project : project.id => project if contains(keys(project), "volume") && project.volume != null }
  region_name  = var.region
  service_name = ovh_cloud_project.this[each.key].project_id
  description  = lookup(each.value, "description")
  name         = lookup(each.value, "name")
  size         = lookup(each.value, "size")
  type         = lookup(each.value, "type")
}

resource "ovh_cloud_project_volume_backup" "this" {
  for_each = { for project in var.project : project.id => project if contains(keys(project), "volume") && project.volume != null && project.volume[0].backup == true }
  region_name  = var.region
  service_name = ovh_cloud_project.this[each.key].project_id
  volume_id    = ovh_cloud_project_volume.this[each.key].id
  name         = join("-", [lookup(each.value, "name"), "backup"])
}