# ======================================================================================================================
# DNS Zones
# ======================================================================================================================

# Data block for parent zone name
data "azurerm_dns_zone" "parent" {
  name                = "test.zone.com"
}

# Resource block for creating project sub domains
resource "azurerm_dns_zone" "project_domain" {
  for_each            = var.sub_domain
  name                = "${lookup(each.value, "name", "")}.${data.azurerm_dns_zone.parent.name}"
  resource_group_name = lookup(each.value, "resource_group", var.resource_group)
}

# Add ns record for project domain to parent domain
resource "azurerm_dns_ns_record" "project_domain_ns" {
  for_each            = var.sub_domain
  name                = "${lookup(each.value, "name", "")}-ns-record"
  zone_name           = data.azurerm_dns_zone.parent.name
  resource_group_name = lookup(each.value, "resource_group", var.resource_group)
  ttl                 = 300

  records = azurerm_dns_zone.project_domain[each.key].name_servers
}

# ======================================================================================================================
# DNS Records
# ======================================================================================================================

# Resource block for a records
resource "azurerm_dns_a_record" "a_record" {
  for_each            = var.a_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.a_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")
  records             = lookup(each.value, "record", "")
}

# Resource block for aaaa records
resource "azurerm_dns_aaaa_record" "aaaa_record" {
  for_each            = var.aaaa_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.aaaa_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")
  records             = lookup(each.value, "records", "")
}

# Resource block for caa records
resource "azurerm_dns_caa_record" "caa_record" {
  for_each            = var.caa_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.caa_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")

  dynamic record {
    for_each = lookup(each.value, "records", {})
    content {
      flags           = record.value["flags"]
      tag             = record.value["tag"]
      value           = record.value["value"]
    }
  }
}

# Resource block for cname records
resource "azurerm_dns_cname_record" "cname_record" {
  for_each            = var.cname_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.cname_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")
  record              = lookup(each.value, "record", "")
}

# Resource block for mx records
resource "azurerm_dns_mx_record" "mx_record" {
  for_each            = var.mx_record
  name                = "test"
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.mx_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")
  
  dynamic record {
    for_each = lookup(each.value, "records", {})
    content {
      preference      = record.value["preference"]
      exchange        = record.value["exchange"]
    }
  }
}

# Resource block for ns records
resource "azurerm_dns_ns_record" "ns_record" {
  for_each            = var.ns_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.ns_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")

  records             = lookup(each.value, "records", "")
}

# Resource block for ptr records
resource "azurerm_dns_ptr_record" "ptr_record" {
  for_each            = var.ptr_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.ptr_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")
  records             = lookup(each.value, "records", "")
}

# Resource block for srv records
resource "azurerm_dns_srv_record" "srv_record" {
  for_each            = var.srv_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.srv_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")

  dynamic record {
    for_each = lookup(each.value, "records", {})
    content {
      priority        = record.value["priority"]
      weight          = record.value["weight"]
      port            = record.value["port"]
      target          = record.value["target"]
    }
  }
}

# Resource block for txt records
resource "azurerm_dns_txt_record" "txt_record" {
  for_each            = var.txt_record
  name                = lookup(each.value, "name", "")
  zone_name           = azurerm_dns_zone.project_domain[lookup(var.txt_record[each.key], "zone", var.default_zone)].name
  resource_group_name = var.resource_group
  ttl                 = lookup(each.value, "ttl", "300")

  dynamic record {
    for_each = lookup(each.value, "records", {})
    content {
      value           = record.value["value"]
    }
  }
}