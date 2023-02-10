# module "dns" {
#     source = "../modules/dns"
#     resource_group = var.resource_group

# # ======================================================================================================================
# # DNS Zones
# # ======================================================================================================================
#     sub_domain = {
#         # example_project = {
#         #     name           = "example-domain"
#         #     resource_group = var.resource_group
#         # }
#     }

# # Default zone for records (unless specified otherwise using the "zone" argument in the record)
# # This should be the map name of the zone within the "sub_domain" variable, NOT the value of the "name" argument within the zone map
# default_zone = "example_project"

# # ======================================================================================================================
# # DNS Records
# # ======================================================================================================================

# # All Record types support the following additional arguments:
# #   zone - This allows records to be assigned to a other zones specified in the sub_domain variable above (default is the zone assigned to the default_zone variable)
# #   ttl  - This can be set to any specified value (default is 300)

# # a records
#     a_record = {
#         # example_a_record = {
#         #     name   = "example-a-record"
#         #     record = ["10.0.0.10"]
#         # }
#     }

# # aaaa records
#     aaaa_record = {
#         # example_aaaa_record = {
#         #     name    = "example-aaaa-record"
#         #     records = ["2001:db8::1:0:0:1"]
#         # }
#     }

# # caa records
#     caa_record = {
#         # example_caa_record = {
#         #     name = "example-caa-record"
#         #     records = {
#         #         record_item_1 = {
#         #             flags = 0
#         #             tag   = "issue"
#         #             value = "example.net"
#         #         }
#         #         record_item_2 = {
#         #             flags = 0
#         #             tag   = "issuewild"
#         #             value = ";"
#         #         }
#         #     }
#         # }
#     }

# # cname records
#     cname_record = {
#         # example_cname_record = {
#         #     name   = "example-cname-record"
#         #     record = "example.domain.com"
#         # }
#     }

# # mx records
#     mx_record = {
#         # example_mx_record = {
#         #     name    = "example-mx-record"
#         #     records = {
#         #         record_item_1 = {
#         #             preference = 10
#         #             exchange   = "email.address-1.com"
#         #         }
#         #         record_item_2 = {
#         #             preference = 20
#         #             exchange   = "email.address-2.com"
#         #         }
#         #     }
#         # }

#     }

# # ns records
#     ns_record = {
#         # example_ns_record = {
#         #     name    = "example-ns-record"
#         #     records = ["ns1.example.com.", "ns2.example.com."]
#         # }
#     }

# # ptr records
#     ptr_record = {
#         # example_ptr_record = {
#         #     name   = "example-ptr-record"
#         #     records = ["exampledomain.com", "anotherexampledomain.com"]
#         # }
#     }

# # srv records
#     srv_record = {
#         # example_srv_record = {
#         #     name = "example-srv-record"
#         #     records = {
#         #         record_item_1 = {
#         #             priority = 1
#         #             weight   = 5
#         #             port     = 8080
#         #             target   = "example.domain.com"
#         #         }
#         #     }
#         # }
#     }

# # txt records
#     txt_record = {
#         # example_txt_record = {
#         #     name = "example-txt-record"
#         #     records = {
#         #         record_item_1 = {
#         #             value = "google-site-authenticator"
#         #         }
#         #         record_item_2 = {
#         #             value = "more site information here"
#         #         }
#         #     }
#         # }
#     }
# }