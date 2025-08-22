variable "ceph_acl" {
  type    = object({
    netmask      = string
    network      = string
  })
}

variable "ceph_service_name" {
  type = string
}