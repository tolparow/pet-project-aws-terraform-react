module "front" {
  source = "./tf"

  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  cert_arn   = var.CERT_ARN
}
