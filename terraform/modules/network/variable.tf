# Variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "eu-central-1"
}
variable "availability_zone" {
  default = "eu-central-1a"
}
variable "cidr_block_range" {
  description = "The CIDR block for the VPC"
  default     = "172.31.0.0/16"
}
variable "subnet1_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default     = "172.31.16.0/20"
}
variable "environment_tag" {
  description = "Environment tag"
  default     = ""
}
variable "project_tag" {
  description = "nginx via terraform"
  default     = ""
}
variable "department_tag" {
  description = "CnA"
  default     = ""
}
