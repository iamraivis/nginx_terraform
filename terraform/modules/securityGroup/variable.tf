variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "eu-central-1"
}

variable "vpc_id" {
  description = "VPC id"
  default     = ""
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "dev"
}
variable "project_tag" {
  description = "nginx via terraform"
  default     = "dev"
}
variable "department_tag" {
  description = "CnA"
  default     = "dev"
}
