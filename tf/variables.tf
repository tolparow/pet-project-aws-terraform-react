variable "domain_name" {
  type        = string
  description = "Name of the domain"
  default     = "demo.tolpart.ae"
}
variable "bucket_name" {
  type        = string
  description = "Name of the bucket."
  default     = "demo.tolpart.ae"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "access_key" {
  type    = string
  default = "access"
}
variable "secret_key" {
  type    = string
  default = "secret"
}
