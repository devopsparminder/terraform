variable "location_shortname" {

}
variable "location_fullname" {

}
variable "environment" {
  type = string
  validation {
    condition     = contains(["dev", "dev1", "poc", "dev2", "test", "stage", "prod"], var.environment)
    error_message = "The environment must be dev,dev1,dev2, test, stage or prod."
  }
}
variable "tags" {
  type    = map(string)
  default = {}
}
