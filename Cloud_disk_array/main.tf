resource "ovh_dedicated_ceph_acl" "this" {
  netmask      = var.ceph_acl.netmask
  network      = var.ceph_acl.network
  service_name = data.ovh_dedicated_ceph.this.id
}
