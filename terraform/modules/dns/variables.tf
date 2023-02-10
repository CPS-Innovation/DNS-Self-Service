# General Configuration
variable "resource_group" {}

# Project zone and default for records
variable "sub_domain" {}
variable "default_zone" {}

# DNS record variables
variable "a_record" {}
variable "aaaa_record" {}
variable "caa_record" {}
variable "cname_record" {}
variable "mx_record" {}
variable "ns_record" {}
variable "ptr_record" {}
variable "srv_record" {}
variable "txt_record" {}