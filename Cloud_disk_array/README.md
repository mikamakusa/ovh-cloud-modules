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

## Example
```hcl
module "ceph_acl" {
  source = "."
  ceph_acl = {
    network      = "1.2.3.4"
    netmask      = "255.255.255.255"
  }
  ceph_service_name = "aabbbcc-hhhh-yyyy-xxxx-uuuuu0000"
}
```

## Resources

| Name | Type |
|------|------|
| [ovh_dedicated_ceph_acl.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/dedicated_ceph_acl) | resource |
| [ovh_dedicated_ceph.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/data-sources/dedicated_ceph) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ceph_acl"></a> [ceph\_acl](#input\_ceph\_acl) | n/a | <pre>object({<br/>    netmask      = string<br/>    network      = string<br/>  })</pre> | n/a | yes |
| <a name="input_ceph_service_name"></a> [ceph\_service\_name](#input\_ceph\_service\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acls"></a> [acls](#output\_acls) | n/a |
