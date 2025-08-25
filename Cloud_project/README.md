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
```hcl
data "ovh_me" "myaccount" {}

data "ovh_order_cart" "mycart" {
  ovh_subsidiary = data.ovh_me.myaccount.ovh_subsidiary
}

data "ovh_order_cart_product_plan" "cloud" {
  cart_id        = data.ovh_order_cart.mycart.id
  price_capacity = "renew"
  product        = "cloud"
  plan_code      = "project.2018"
}

module "project" {
  source = "./"
  project = [{
    ovh_subsidiary = data.ovh_order_cart.mycart.ovh_subsidiary
    description    = "my cloud project"
    plan = [
      {
        duration     = data.ovh_order_cart_product_plan.cloud.selected_price.0.duration
        plan_code    = data.ovh_order_cart_product_plan.cloud.plan_code
        pricing_mode = data.ovh_order_cart_product_plan.cloud.selected_price.0.pricing_mode
      }
    ]
    alerting = [{
      delay             = 3600
      email             = "aaa.bbb@domain.com"
      monthly_threshold = 1000
    }]
    region = [{
      region       = "EU-WEST-LZ-LUX-A"
    }]
    ssh_key = [{
      public_key   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC9xPpdqP3sx2H+gcBm65tJEaUbuifQ1uGkgrWtNY0PRKNNPdy+3yoVOtxk6Vjo4YZ0EU/JhmQfnrK7X7Q5vhqYxmozi0LiTRt0BxgqHJ+4hWTWMIOgr+C2jLx7ZsCReRk+fy5AHr6h0PHQEuXVLXeUy/TDyuY2JPtUZ5jcqvLYgQ== my-key"
      name         = "new_key"
    }]
  }]
}
```

## Resources

| Name | Type |
|------|------|
| [ovh_cloud_project.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project) | resource |
| [ovh_cloud_project_alerting.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_alerting) | resource |
| [ovh_cloud_project_ssh_key.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_ssh_key) | resource |
| [ovh_cloud_project_user.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_user) | resource |
| [ovh_cloud_project_volume.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_volume) | resource |
| [ovh_cloud_project_volume_backup.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_volume_backup) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | n/a | <pre>list(object({<br/>    id             = string<br/>    description    = optional(string)<br/>    ovh_subsidiary = optional(string)<br/>    plan = optional(list(object({<br/>      duration     = string<br/>      plan_code    = string<br/>      pricing_mode = string<br/>      configuration = optional(list(object({<br/>        label = string<br/>        value = string<br/>      })))<br/>    })))<br/>    plan_option = optional(list(object({<br/>      duration     = string<br/>      plan_code    = string<br/>      pricing_mode = string<br/>      configuration = optional(list(object({<br/>        label = string<br/>        value = string<br/>      })))<br/>    })))<br/>    alerting = optional(list(object({<br/>      delay             = number<br/>      email             = string<br/>      monthly_threshold = number<br/>    })))<br/>    ssh_key = optional(list(object({<br/>      name       = string<br/>      public_key = string<br/>    })))<br/>    user = optional(list(object({<br/>      description    = optional(string)<br/>      role_name      = optional(string)<br/>      role_names     = optional(list(string))<br/>      password_reset = optional(string)<br/>    })))<br/>    volume = optional(list(object({<br/>      region_name = string<br/>      description = optional(string)<br/>      name        = optional(string)<br/>      size        = optional(number)<br/>      type        = optional(string)<br/>      backup      = optional(bool)<br/>    })))<br/>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project"></a> [project](#output\_project) | # ovh\_cloud\_project |
| <a name="output_project_alerting"></a> [project\_alerting](#output\_project\_alerting) | # ovh\_cloud\_project\_alerting |
| <a name="output_project_ssh_key"></a> [project\_ssh\_key](#output\_project\_ssh\_key) | # ovh\_cloud\_project\_ssh\_key |
| <a name="output_project_user"></a> [project\_user](#output\_project\_user) | # ovh\_cloud\_project\_user |
| <a name="output_project_volume"></a> [project\_volume](#output\_project\_volume) | # ovh\_cloud\_project\_volume |
| <a name="output_project_volume_backup"></a> [project\_volume\_backup](#output\_project\_volume\_backup) | # ovh\_cloud\_project\_volume\_backup |
