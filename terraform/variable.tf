variable "access_key" { }
variable "secret_key" { }
variable "region" {
  default = "eu-central-1"
}
variable "availability_zone" {
  default = "eu-central-1b"
}
variable "environment_tag" {
  description = "Environment tag"
  default     = "dev"
}
variable "project_tag" {
  description = "nginx via terraform"
  default     = "nginx via terraform"
}
variable "department_tag" {
  description = "CnA"
  default     = "CnA"
}
