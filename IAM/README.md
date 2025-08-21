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

- **ovh_iam_policy**
```hcl
data "ovh_me" "account" {}

module "iam_policy" {
  source = "."
  identity_groups = [{
    name = "group-1"
    role = "UNPRIVILEGED"
    policies = [{
      name        = "allow_ovh_manager"
      resources   = [data.ovh_me.account.urn]
      allow = [
        "account:apiovh:me/get",
        "account:apiovh:me/supportLevel/get",
        "account:apiovh:me/certificates/get",
        "account:apiovh:me/tag/get",
        "account:apiovh:services/get",
        "account:apiovh:*",
      ]
    }]
  }]
}
```

- **api_oauth2_client**
```hcl
module "api_oauth2_clients" {
  source = "."
  api_oauth2_clients = [{
    name        = "client credentials service account"
    description = "An OAuth2 client using the client credentials flow for my app"
    flow        = "CLIENT_CREDENTIALS"
  },{
    name          = "OAuth2 authorization code service account"
    flow          = "AUTHORIZATION_CODE"
    description   = "An OAuth2 client using the authorization code flow for my-app.com"
    callback_urls = ["https://my-app.com/callback"]
  }]
}
```

## Resources

| Name | Type |
|------|------|
| [ovh_iam_permissions_group.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/iam_permissions_group) | resource |
| [ovh_iam_policy.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/iam_policy) | resource |
| [ovh_iam_resource_group.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/iam_resource_group) | resource |
| [ovh_me_api_oauth2_client.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/me_api_oauth2_client) | resource |
| [ovh_me_identity_group.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/me_identity_group) | resource |
| [ovh_me_identity_user.this](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/me_identity_user) | resource |

## Inputs

| Name                                                                                         | Description | Type | Default | Required |
|----------------------------------------------------------------------------------------------|-------------|------|---------|:--------:|
| <a name="input_api_oauth2_clients"></a> [api\_oauth2\_clients](#input\_api\_oauth2\_clients) | Crée un compte de service OAuth2 | <pre>list(object({<br/>    description   = string<br/>    flow          = string<br/>    name          = string<br/>    callback_urls = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_identity_groups"></a> [identity\_groups](#input\_identity\_group)             | Crée un identity group | <pre>list(object({<br/>    name        = string<br/>    description = optional(string)<br/>    role        = optional(string)<br/>    policies = optional(list(object({<br/>      name               = string<br/>      resources          = list(string)<br/>      description        = optional(string)<br/>      allow              = optional(list(string))<br/>      except             = optional(list(string))<br/>      deny               = optional(list(string))<br/>      permissions_groups = optional(list(string))<br/>    })))<br/>  }))</pre> | `[]` | no |
| <a name="input_identity_users"></a> [identity\_users](#input\_identity\_user)                | Crée un identity user | <pre>list(object({<br/>    email       = string<br/>    login       = string<br/>    password    = string<br/>    description = optional(string)<br/>    group       = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_permission_groups"></a> [permission\_groups](#input\_permission\_groups)      | n/a | <pre>list(object({<br/>    description = string<br/>    name        = string<br/>    allow       = optional(list(string))<br/>    except      = optional(list(string))<br/>    deny        = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups)            | n/a | <pre>list(object({<br/>    name      = string<br/>    resources = optional(list(string))<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clients"></a> [clients](#output\_clients) | n/a |
| <a name="output_groups"></a> [groups](#output\_groups) | n/a |
| <a name="output_identity_groups"></a> [identity\_groups](#output\_identity\_groups) | n/a |
| <a name="output_identity_users"></a> [identity\_users](#output\_identity\_users) | n/a |
| <a name="output_permission_groups"></a> [permission\_groups](#output\_permission\_groups) | n/a |
| <a name="output_policies"></a> [policies](#output\_policies) | n/a |
