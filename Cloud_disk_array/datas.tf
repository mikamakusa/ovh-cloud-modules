data "ovh_dedicated_ceph" "this" {
  service_name = var.ceph_service_name
}
