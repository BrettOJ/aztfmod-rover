variable "app_name" {

}

variable "env" {

}

variable "resource_group_name" {

}

variable "location" {
  
}

variable "publisher_name" {}

variable "publisher_email" {}

variable "sku_name" {
  description = "(Required) sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  default     = "Developer_1"
}

variable "tags" {}
