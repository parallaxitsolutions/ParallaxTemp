variable "rgname" {
  type = string
  default = "aptitude_test_rg"
}

variable "appsvcplanname" {
  type = string
  default = "aptitude_test_plan"
}

variable "location" {
  type = string
  default = "UK South"
}

variable "serviceplan_os_type" {
    type = string
    default = "Windows"
}

variable "serviceplan_sku" {
    type = string
    default = "F1"
}

variable "appservicename" {
    type = string
    default = "parallaxtestapp-2611"
}

variable "dotnet_version" {
    type = string
    default = "v7.0"
}