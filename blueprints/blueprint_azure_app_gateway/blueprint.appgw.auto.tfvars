/*
app_gw = {
       name                = "app_gw_test"
       location            = "southeastasia"
       sku_name            = "sku_name"
       sku_tier            = "standard"
       sku_capacity        = 2
       frontend_port       = 80
       backend_http_cookie_based_affinity = "Disabled"
       backend_http_path               = "/path1/"
       backend_http_port               = 80
       backend_http_protocol           = "Http"
      backend_http_request_timeout    = 1
       http_listener_protocol          = "Http"
       rrr_rule_type                   = "basic"
 }

waf_configuration = {
      enabled = true
      firewall_mode  = "Detection"  # (Required) The Web Application Firewall Mode. Possible values are Detection and Prevention.
      rule_set_type = "OWASP"   #(Required) The Type of the Rule Set used for this Web Application Firewall.
      rule_set_version = "3.1"  #(Required) The Version of the Rule Set used for this Web Application Firewall. Possible values are 2.2.9, 3.0, and 3.1.
}
*/