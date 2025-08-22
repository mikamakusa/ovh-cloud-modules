output "acls" {
  value = {
    for acl in ovh_dedicated_ceph_acl.this : acl => {
      service_name = acl.service_name
      network      = acl.network
      netmask      = acl.netmask
      family       = acl.family
      id           = acl.id
    }
  }
}
